/******************************************************************************
 * File name:		target.c
 *
 * Description:	This file contains the pin setup code needed for a PSAS GFE
 * 				wired as a control module on the Rocket Tracks project. This
 * 				code sets the pins to a safe state to startup without damaging
 * 				any connected hardware, and then the code sets the pins as
 * 				needed for the system functionality.
 *
 * Author:		Dan Kirkpatrick
 * Date:		2/28/2012
 *****************************************************************************/
#include "lpc23xx.h"
#include "target.h"


/******************************************************************************
* Function name:	void targetSetPinsForApplication(void)
*
* Description:		Initialize the target processor for the specific
* 					application by setting up IO pins
******************************************************************************/
void targetSetPinsForApplication(void)
{
	SCS |= 1; //Configure FIO

#define RED_LED_PIN          19
#define BLUE_LED_PIN         22
#define GREEN_LED_PIN        25


	// P1.19, P1.22, & P1.25 for RED, BLUE, and GREEN GFE LEDs. P1.23, P1.24,
	// P1.26, and P1.27 for Vert Neutral, Lat Neutral, Position, and Velocity
	// LEDs; all as OUTPUTS
	FIO1DIR = ( 0x00000000 |
			(1<<19) | (1<<22) | (1<<25) | (1<<23) | (1<<24) | (1<<26) | (1<<27) );

	// Turn on GFE tri-color LEDS
	FIO1SET = ( (1 << RED_LED_PIN) | (1 << GREEN_LED_PIN) | (1 << BLUE_LED_PIN) );

	// Set P0.6, P0.7, P0.8, and P0.9 for digital inputs. Then set pull downs.
	FIO0DIR &= ~(0x00000000 | (1 << 6) | (1 << 7) | (1 << 8) | (1 << 9));
	PINMODE0 |= ((3<<12) | (3<<14) | (3<<16) | (3<<18));

	// Set P0.16 and P0.17 for enable and watchdog timer. Then turn them off.
	FIO0DIR |= (0x00000000 | (1 << 16) | (1 << 17));
	FIO0CLR = (0x00000000 | (1 << 16) | (1 << 17));

	// Set P0.23, P0.24, P0.25, P0.26 as an input for ADC channel AD0[0] - AD0[3]
	FIO0DIR &= ~((1 << 23) | (1 << 24) | (1 << 25) | (1 << 26));
	PINSEL1 = (0x00000000 | (1 << 14) | (1 << 16) | (1 << 18) | (1 << 20)); // AD0[0] bits 15:14 First alt function, ADC 0-3

	// Turn off P2.0, P2.1, P2.2, P2.3 for PWM 1.1-1.4
	FIO2CLR = ( (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) );

	// Set P2.0, P2.1, P2.2, P2.3, P2.4, and P2.5 pins as outputs for
	// PWM1.1 - PWM1.6. PWM1.5, 1.6 drive the short lead (vertical) motor;
	// PWM1.3, 1.2 drive the long lead (lateral) motor
	FIO2DIR |= ( (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5) );

	// bits 1:0 1st alt function, PWM1.1, 1.2, 1.3, 1.4, 1.5, and 1.6.
	PINSEL4 = ( 0x00000000 |
			(1 << 0) | (1 << 2) | (1 << 4) | (1 << 6) | (1 << 8) | (1 << 10) );

    return;
} // End void setPinsForApplication(void)


/******************************************************************************
* Function name:		targetGPIOResetPins
*
* Description:		Initialize all pins to a safe state. Called immediately
* 					at startup.
******************************************************************************/
void targetGPIOResetPins( void )
{
	// Set up GPIO ports 0 and 1 for desired access speed

	// Set system control reg to reset value (0x00)
	SCS |= 0x00000001;		// GPIOM set for high speed access

	// Reset all GPIO pins to default: primary function
	PINSEL0 = 0x00000000;
    PINSEL1 = 0x00000000;
    PINSEL2 = 0x00000000;
    PINSEL3 = 0x00000000;
    PINSEL4 = 0x00000000;
    PINSEL5 = 0x00000000;
    PINSEL6 = 0x00000000;
    PINSEL7 = 0x00000000;
    PINSEL8 = 0x00000000;
    PINSEL9 = 0x00000000;
    PINSEL10 = 0x00000000;

    // PINMODEx sets pull-up/down for each pin

    IODIR0 = 0x00000000;
    IODIR1 = 0x00000000;
	IOCLR0 = 0xFFFFFFFF;
    IOCLR1 = 0xFFFFFFFF;

    FIO0MASK = 0x00000000; // Allow changes to all ports
    FIO1MASK = 0x00000000;
    FIO2MASK = 0x00000000;
    FIO3MASK = 0x00000000;
    FIO4MASK = 0x00000000;

    FIO0DIR = 0x00000000; // Set all ports to inputs
    FIO1DIR = 0x00000000;
    FIO2DIR = 0x00000000;
    FIO3DIR = 0x00000000;
    FIO4DIR = 0x00000000;

    FIO0CLR = 0xFFFFFFFF; // Clear all port output registers
    FIO1CLR = 0xFFFFFFFF;
    FIO2CLR = 0xFFFFFFFF;
    FIO3CLR = 0xFFFFFFFF;
    FIO4CLR = 0xFFFFFFFF;

    return;
} // End void GPIOResetPins( void )
