



		// Play with LED's
		switch(u8UpDown){
		case 1:
			if(u32LedCount > 0){
				u32LedCount--;
			} else {
				u8UpDown = 0;
				if(u8RGB==3){
					u8RGB = 0;
				} else {
					u8RGB++;
				}
			}
			break;
		case 0:
		default:
			if(u32LedCount < 129){//55){//3299){
				u32LedCount++;
			} else {
				u8UpDown = 1;
			}
			break;
		}

		switch(u8RGB){
		case 0:
			//pwmSetOnTimeSingleEdge(PWM1_2, microsecondsToPWMTicks(u32LedCount*u32LedCount));
			break;
		case 1:
			//pwmSetOnTimeSingleEdge(PWM1_3, microsecondsToPWMTicks(u32LedCount*u32LedCount));
			break;
		case 2:
			//pwmSetOnTimeSingleEdge(PWM1_4, microsecondsToPWMTicks(u32LedCount*u32LedCount));
			break;
		case 3:
			//pwmSetOnTimeSingleEdge(PWM1_2, microsecondsToPWMTicks(u32LedCount*u32LedCount));
			//pwmSetOnTimeSingleEdge(PWM1_3, microsecondsToPWMTicks(u32LedCount*u32LedCount));
			//pwmSetOnTimeSingleEdge(PWM1_4, microsecondsToPWMTicks(u32LedCount*u32LedCount));
			break;
		}



		//		// ******************** LATERAL **********************
		//		const uint16_t U16LatHighLimit = 800;
		//		const uint16_t U16LatLowLimit = 300;
		//		const uint16_t U16LatVelocityPGain = 2;
		//		const uint16_t U16LatVelocityIGain = 0;
		//
		//		// Compute lateral command
		//		ptr->S16LateralCommand = (int16_t)ptr->U16LateralInputADC - 511;
		//
		//		// Reverse Control Potentiometer direction
		//		ptr->S16LateralCommand = -ptr->S16LateralCommand;
		//
		//		// Limit lateral position and check open circuit on lateral sensor
		//		if(ptr->U16LateralFeedbackADC < 5){
		//			ptr->S16LateralCommand = 0;
		//		}
		//		else if( (ptr->U16LateralFeedbackADC > U16LatHighLimit) &&
		//				 (ptr->S16LateralCommand < 0) ){
		//			ptr->S16LateralCommand = 0;
		//		}
		//		else if( (ptr->U16LateralFeedbackADC < U16LatLowLimit) &&
		//				 (ptr->S16LateralCommand > 0) ){
		//			ptr->S16LateralCommand = 0;
		//		}
		//
		//		// Limit lateral command to allowed range
		//		if(ptr->S16LateralCommand > LATERAL_COMMAND_LIMIT){
		//			ptr->S16LateralCommand = LATERAL_COMMAND_LIMIT;
		//		}else if(ptr->S16LateralCommand < -LATERAL_COMMAND_LIMIT){
		//			ptr->S16LateralCommand = -LATERAL_COMMAND_LIMIT;
		//		}


		//		// ************* Position Loop *************
		//
		//		// Compute desired position
		//		ptr->S16PositionDesired = (int16_t)ptr->U16InputADC - 511;
		//
		//		// Compute actual position
		//		ptr->S16PositionActual = (int16_t)ptr->U16FeedbackADC - 511;
		//
		//		// Compute position error
		//		ptr->S16PositionError = ptr->S16PositionDesired - (-ptr->S16PositionActual);
		//
		//		// Compute Proportional Term
		//		ptr->S32PositionPTerm = ptr->S16PositionError * ptr->U16PositionPGain;
		//
		//		// Compute Integral Term and Saturate Result
		//		ptr->S32PositionIAccumulator = ptr->S32PositionIAccumulator +
		//				((int32_t)ptr->S16PositionError * (int32_t)ptr->U16PositionIGain);
		//		if(ptr->S32PositionIAccumulator > (256*ptr->U16CommandLimit)){
		//			ptr->S32PositionIAccumulator = (256*ptr->U16CommandLimit);
		//		}
		//		else if(ptr->S32PositionIAccumulator < (-256*ptr->U16CommandLimit)){
		//			ptr->S32PositionIAccumulator = (-256*ptr->U16CommandLimit);
		//		}
		//		ptr->S32PositionITerm = ptr->S32PositionIAccumulator / 256;
		//
		//		// Compute Derivative Term and Saturate Result
		//		ptr->S32PositionDTerm = ( (ptr->S16PositionError - ptr->S16PositionErrorPrevious) *
		//				ptr->U16PositionDGain) / 10;
		//		if(ptr->S32PositionDTerm > ptr->U16CommandLimit){
		//			ptr->S32PositionDTerm = ptr->U16CommandLimit;
		//		}
		//		else if(ptr->S32PositionDTerm < -ptr->U16CommandLimit){
		//			ptr->S32PositionDTerm = -ptr->U16CommandLimit;
		//		}
		//		ptr->S16PositionErrorPrevious = ptr->S16PositionError;
		//
		//
		//		// ************* \Position Loop *************
		//
		//
		//
		//		// ************* Vertical Velocity Loop *************
		//
		//		// Compute desired velocity
		//		ptr->S16VelocityDesired = (int16_t)ptr->U16InputADC - 511;
		//
		//		// Compute actual vertical velocity
		//		ptr->S16VelocityActual = (int16_t)ptr->U16FeedbackADC - (int16_t)ptr->U16FeedbackADCPrevious;
		//		ptr->U16FeedbackADCPrevious = ptr->U16FeedbackADC;
		//
		//		// Compute velocity error
		//		ptr->S16VelocityError = ptr->S16VelocityDesired - ptr->S16VelocityActual;
		//
		//		// Compute Proportional Term
		//		ptr->S32VelocityPTerm = ptr->S16VelocityError * ptr->U16VelocityPGain;
		//
		//		// Compute Integral Term and Saturate Result
		//		// S32VelocityIAccumulator = S32VelocityIAccumulator + ((int32_t)S16VelocityError * (int32_t)U16VelocityIGain);
		//		// S32VelocityITerm = S32VelocityIAccumulator / 256;
		//
		//
		//		// ************* \Vertical Velocity Loop *************
		//
		//		// Check position / velocity mode
		//		if(ptr->U8PosnVelMode == 1){
		//			// Sum Position Terms
		//			ptr->S16OutputCommand = ptr->S32PositionPTerm;
		//			ptr->S16OutputCommand += ptr->S32PositionITerm;
		//			ptr->S16OutputCommand += ptr->S32PositionDTerm;
		//		}else{
		//			// Sum Velocity Terms
		//			ptr->S16OutputCommand = ptr->S32VelocityPTerm; // + ptr->S32VelocityITerm;
		//		}



		//	FIO0DIR |= (1 << 6);
		//	FIO0DIR |= (1 << 13);//Set USBLINK led to output gpio on 2378 dev board
		//	FIO1DIR |= (1 << 19);
		//	FIO1DIR |= (1 << 29);//Debug IO line for o-scope verification, EXT2-11 on the olimex 2378 dev board

		//	FIO4DIR |= (1 << 30);//Debug IO line for o-scope verification, EXT1-4 on the olimex 2378 dev board
		//	FIO4DIR |= (1 << 31);//Debug IO line for o-scope verification, EXT1-3 on the olimex 2378 dev board
		//
		//	FIO1SET = (1 << 19);		// Turn off STAT LED
		//    FIO1DIR |= (1 << 19);		// Set STAT LED pin as an output
		//
		//    FIO1SET = (1 << 29);
		//    FIO1DIR |= (1 << 29);		// Debug IO line for o-scope verification, EXT2-11 on the olimex 2378 dev board
		//
		//    FIO0SET = (1 << 13);		// Turn off USB_LINK LED
		//    FIO0DIR |= (1 << 13);		// Set USB_LINK LED pin as an output
		//
		//    FIO0CLR = (1 << 0);			// Turn off P0.0
		//    FIO0DIR |= (1 << 0);		// Set P0.0 pin as an output
		//
		//    FIO0CLR = (1 << 1);			// Turn off P0.1
		//    FIO0DIR |= (1 << 1);		// Set P0.1 pin as an output
		//
		//    FIO0DIR &= ~(1 << 29);		// Set P0.29 pin as an input on pin But1 for launch detect
		//
		//    FIO0DIR &= ~(1 << 6);		// Leave P0.6 as an input
		//
		//    FIO0CLR = (1 << 16);		// Turn off P0.16 pin SSP0: SSEL Wired to CNV on ADC
		//    FIO0DIR |= (1 << 16);		// Set P0.16 pin as an output
		//
		//    FIO0CLR = (1 << 7);			// Turn off P0.7
		//    FIO0DIR |= (1 << 7);		// Set P0.7 pin as an output
		//
		//    FIO0CLR = (1 << 8);			// Turn off P0.8
		//    FIO0DIR |= (1 << 8);		// Set P0.8 pin as an output
		//
		//    FIO2CLR = (1 << 0);			// Turn off P2.0
		//    FIO2DIR |= (1 << 0);		// Set P2.0 pin as an output for PWM1.1 to drive SERVO
		//
		//    FIO0DIR &= ~(1 << 9);		// Leave P0.9 as an input: SDO from ADC, also tied to IRQ
		//    FIO2DIR &= ~(1 << 9);		// Leave P2.9 pin as an input to poll ADC data ready (IRQ)
		//
		//	PINSEL0 = (0x00000000 | (2 << 8) | (2 << 10) | (2 << 30)); // CAN-TD2/CAN-RD2/SSP0-SCK0 = '10b (function 2)
		////	PINMODE0 = (PINMODE0 | (1<<9) | (1<<11)) & ~((1<<8) | (1<<10));//disable pullup and pulldown resitors
		////	PINSEL0  = (PINSEL0  | (1<<9) | (1<<11)) & ~((1<<8) | (1<<10));//Set P0.4 and P0.5 into RD2 and TD2 mode
		//
		//
		//	//PINSEL1 = (0x00000000 | (2 << 0) | (2 << 2) | (2 << 4)); // SSEL0/MISO0/MOSI0 = '10b (function 2)
		//	//PINSEL1 = (0x00000000 | (2 << 2) | (2 << 4)); // MISO0/MOSI0 = '10b (function 2)
		//	PINSEL1 = (0x00000000 | (2 << 2)); // MISO0 = '10b (function 2) MOSI0 is not used on roll control
		//
		//	PINSEL4 = (0x00000000 | (1 << 0)); // PWM1.1 bits 1:0 First alt function, which is PWM1.1 for SERVO
