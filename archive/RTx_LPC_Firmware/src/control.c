/******************************************************************************
 * File name:		control.c
 *
 * Description:		Provides PID position control of an axis in the "Rocket-
 * 					Tracks" antenna pointer system. When in velocity mode,
 * 					this code keeps a desired position variable that is
 * 					increased or decreased based on position of the input
 * 					control lever.
 *
 * Author:		Dan Kirkpatrick
 * Date:		3/10/2012
 *****************************************************************************/
#include <stdint.h>
#include "lpc23xx.h"
#include "control.h"


void controlLoop(CONTROL_AXIS_STRUCT * ptr)
{
	// Accumulator scaling multiplier
	const uint16_t U16PosDesAccumMultiplyer = 512;
	const uint16_t U16PosDesAccumExponentialDivisor = 256;
	const uint16_t U16VelocityDeadband = 20;

	// ************* Position Loop *************

	// Compute actual position
	ptr->S16PositionActual = (int16_t)ptr->U16FeedbackADC - 511;

	// Check position (1) / velocity (0) mode
	if(ptr->U8PosnVelMode > 0)
	{
		// Compute desired position directly from input
		ptr->S16PositionDesired = (int16_t)ptr->U16InputADC - 511;

		// Initialize accum to present position
		ptr->S32PositionDesiredAccumulator = ptr->S16PositionActual * U16PosDesAccumMultiplyer;
	}else
	{
		// Compute desired velocity with deadband
		ptr->S16VelocityDesired = (int16_t)ptr->U16InputADC - 511;
		if(ptr->S16VelocityDesired > U16VelocityDeadband){
			ptr->S16VelocityDesired -= U16VelocityDeadband;
		}else if(ptr->S16VelocityDesired < -U16VelocityDeadband){
			ptr->S16VelocityDesired += U16VelocityDeadband;
		}else{
			ptr->S16VelocityDesired = 0;
		}

		// Compute desired position (with exponential) from lever integration and saturate
		ptr->S32PositionDesiredAccumulator += ptr->S16VelocityDesired;
		if(ptr->S16VelocityDesired > 0){
			ptr->S32PositionDesiredAccumulator +=
					(ptr->S16VelocityDesired * ptr->S16VelocityDesired) /
					U16PosDesAccumExponentialDivisor;
		}else{
			ptr->S32PositionDesiredAccumulator -=
					(ptr->S16VelocityDesired * ptr->S16VelocityDesired) /
					U16PosDesAccumExponentialDivisor;
		}
		if(ptr->S32PositionDesiredAccumulator >
				(ptr->U16HighPosnLimit-511) * U16PosDesAccumMultiplyer)
		{
			ptr->S32PositionDesiredAccumulator =
				(ptr->U16HighPosnLimit-511) * U16PosDesAccumMultiplyer;
		}
		else if(ptr->S32PositionDesiredAccumulator <
				(ptr->U16LowPosnLimit-511) * (int16_t)U16PosDesAccumMultiplyer)
		{
			ptr->S32PositionDesiredAccumulator =
					(ptr->U16LowPosnLimit-511) * (int16_t)U16PosDesAccumMultiplyer;
		}

		ptr->S16PositionDesired = ptr->S32PositionDesiredAccumulator / U16PosDesAccumMultiplyer;
	}

	// Compute position error Negative to deal with potentiometer direction
	ptr->S16PositionError = -(ptr->S16PositionDesired - ptr->S16PositionActual);

	// Compute Proportional Term
	ptr->S32PositionPTerm = ptr->S16PositionError * ptr->U16PositionPGain;

	// Compute Integral Term and Saturate Result
	ptr->S32PositionIAccumulator = ptr->S32PositionIAccumulator +
			((int32_t)ptr->S16PositionError * (int32_t)ptr->U16PositionIGain);
	if(ptr->S32PositionIAccumulator > (256*ptr->U16CommandLimit)){
		ptr->S32PositionIAccumulator = (256*ptr->U16CommandLimit);
	}
	else if(ptr->S32PositionIAccumulator < (-256*ptr->U16CommandLimit)){
		ptr->S32PositionIAccumulator = (-256*ptr->U16CommandLimit);
	}
	ptr->S32PositionITerm = ptr->S32PositionIAccumulator / 256;

	// Compute Derivative Term and Saturate Result
	ptr->S32PositionDTerm = ( (ptr->S16PositionError - ptr->S16PositionErrorPrevious) *
			ptr->U16PositionDGain) / 10;
	if(ptr->S32PositionDTerm > ptr->U16CommandLimit){
		ptr->S32PositionDTerm = ptr->U16CommandLimit;
	}
	else if(ptr->S32PositionDTerm < -ptr->U16CommandLimit){
		ptr->S32PositionDTerm = -ptr->U16CommandLimit;
	}
	ptr->S16PositionErrorPrevious = ptr->S16PositionError;

	// ************* End Position Loop *************

	// Sum Position Terms
	ptr->S16OutputCommand = ptr->S32PositionPTerm;
	ptr->S16OutputCommand += ptr->S32PositionITerm;
	ptr->S16OutputCommand += ptr->S32PositionDTerm;


	// Limit command to allowed range
	if(ptr->S16OutputCommand > ptr->U16CommandLimit){
		ptr->S16OutputCommand = ptr->U16CommandLimit;
	}else if(ptr->S16OutputCommand < -ptr->U16CommandLimit){
		ptr->S16OutputCommand = -ptr->U16CommandLimit;
	}


	// Limit position and check open circuit on sensor
	if(ptr->U16FeedbackADC < 5){
		ptr->S16OutputCommand = 0;
	}
	else if( (ptr->U16FeedbackADC > ptr->U16HighPosnLimit) &&
			 (ptr->S16OutputCommand < 0) ){
		ptr->S16OutputCommand = 0;
	}
	else if( (ptr->U16FeedbackADC < ptr->U16LowPosnLimit) &&
			 (ptr->S16OutputCommand > 0) ){
		ptr->S16OutputCommand = 0;
	}


	// Preset neutral flags to not-neutral
	ptr->U8PositionNeutral = 0;
	ptr->U8VelocityNeutral = 0;

	// If in position mode and position error is low
	if(ptr->U8PosnVelMode > 0)
	{
		if( (ptr->S16PositionError < 5) && (ptr->S16PositionError > -5) )
		{
			ptr->U8PositionNeutral = 1;
		}
	}else{ // If in velocity mode and velocity command is neutral
		if( (ptr->S16VelocityDesired == 0) && (ptr->S16PositionError < 5) &&
				(ptr->S16PositionError > -5) )
		{
			ptr->U8VelocityNeutral = 1;
		}
	}


	// If drive is locked out
	if(ptr->U8DriveIsInterlocked > 0){
		// Command OFF
		ptr->S16OutputCommand = 0;

		// Initialize accum to present position
		ptr->S32PositionDesiredAccumulator = ptr->S16PositionActual * U16PosDesAccumMultiplyer;

		// Reset PI integrator
		ptr->S32PositionIAccumulator = 0;

		// If position or velocity error is low
		if( (ptr->U8PositionNeutral > 0) | (ptr->U8VelocityNeutral > 0) )
		{
			// Remove interlock
			ptr->U8DriveIsInterlocked = 0;
		}
	} // End if(ptr->U8DriveIsInterlocked > 0)

} // End void controlLoop(CONTROL_AXIS_STRUCT * ptr)


