/******************************************************************************
 * File name:			main.c
 *
 * Description:		Main program for Rocket Tracks controller used to control
 * 					axis motors. Used in embedded systems project as part of
 * 					ECE-510 embedded systems.
 *
 * Author:		Dan Kirkpatrick
 * Date:		2/28/2012
 *****************************************************************************/

#include <limits.h>
#include <stdint.h>

#include "lpc23xx.h"

#include <lpc23xx-pll.h>
#include <lpc23xx-pwm.h>
#include <lpc23xx-adc.h>

#include "main.h"
#include "target.h"
#include "control.h"

#define RED_LED_PIN          19
#define BLUE_LED_PIN         22
#define GREEN_LED_PIN        25

#define VERTICAL_COMMAND_LIMIT		300
#define LATERAL_COMMAND_LIMIT		250

#define LED_OFF						0
#define LED_ON						1
#define LED_BLINK					2

static void processLeds(void);
void targetInit(void);
void initTimer1 (void);
uint32_t microsecondsToPWMTicks(const uint32_t microseconds);
uint32_t nanosecondsToPWMTicks(const uint32_t microseconds);

static uint8_t u8OneMillisecondFlag = 0;
static uint32_t U32DelayCount = 0;
static uint8_t U8PosnVelModeSwitch = 0;
static uint32_t u32LedCount = 0;
static uint8_t U8LedState = 0;
static uint8_t U8VertLedState = LED_BLINK;
static uint8_t U8LatLedState = LED_BLINK;
CONTROL_AXIS_STRUCT vertAxisStruct, latAxisStruct;

/******************************************************************************
 * Function name:		main
 *
 * Description:			Called from startup, boot.s
 *****************************************************************************/
int main (void) {

	uint8_t U8EnableDriveSwitch = 0;
	uint8_t U8PrevPosnVelModeSwitchState = 0;

	uint32_t u32Temp = 0;
	volatile uint32_t u32RegMonitor = 0;
	static uint8_t u8WatchDogToggle = 0;
	static uint8_t u8WatchDogCycleCount = 0;

	targetInit();

	pllstart_seventytwomhz();

	// Initialize PWM with a bogus period
	pwmInitSingleEdge(CCLK_DIV4, 0, 4000);

	// Set match control regs for continuous PWM, no interrupts
	pwmSetMatchControlReg(PWM1_0, 0, 0, 0);
	pwmSetMatchControlReg(PWM1_1, 0, 0, 0);
	pwmSetMatchControlReg(PWM1_2, 0, 0, 0);
	pwmSetMatchControlReg(PWM1_3, 0, 0, 0);
	pwmSetMatchControlReg(PWM1_4, 0, 0, 0);
	pwmSetMatchControlReg(PWM1_5, 0, 0, 0);
	pwmSetMatchControlReg(PWM1_6, 0, 0, 0);

	// Turn on channels 1 - 4
	pwmSetChannelState(PWM1_0, 1);
	pwmSetChannelState(PWM1_1, 1);
	pwmSetChannelState(PWM1_2, 1);
	pwmSetChannelState(PWM1_3, 1);
	pwmSetChannelState(PWM1_4, 1);
	pwmSetChannelState(PWM1_5, 1);
	pwmSetChannelState(PWM1_6, 1);

	// Set frequency to 1000Hz, or 1 millisecond
	pwmSetOnTimeSingleEdge(PWM1_0, microsecondsToPWMTicks(1000));

	pwmSetOnTimeSingleEdge(PWM1_2, microsecondsToPWMTicks(0));
	pwmSetOnTimeSingleEdge(PWM1_3, microsecondsToPWMTicks(0));
	pwmSetOnTimeSingleEdge(PWM1_4, microsecondsToPWMTicks(0));
	pwmSetOnTimeSingleEdge(PWM1_5, microsecondsToPWMTicks(0));
	pwmSetOnTimeSingleEdge(PWM1_6, microsecondsToPWMTicks(0));

	// Disable ADC interrupts TODO Is this needed?
	AD0INTEN = 0x00000000;

	adc_init_cont(15, CCLK_DIV1); // Scan AD0, AD1, AD2 and AD3

	u32RegMonitor = AD0CR;

	// Initialize Timer1
	initTimer1();

	// Enable interrupts
	asm volatile (
			"MRS		R1, CPSR		\n\t"
			"BIC		R1, R1, #0x80	\n\t"
			"MSR		CPSR_c, R1		\n\t");

	for(;;)
	{
		// Wait here for tic
		U32DelayCount=0;
		while(!u8OneMillisecondFlag){
			// Add escape
			if(U32DelayCount++ > 500000){
				break;}
		}
		u8OneMillisecondFlag = 0; // Reset flag


		// Read ADC's
		vertAxisStruct.U16FeedbackADC = adc_read(0);
		latAxisStruct.U16FeedbackADC = adc_read(1);
		vertAxisStruct.U16InputADC = adc_read(2);
		latAxisStruct.U16InputADC = adc_read(3);

		// Read input switch positions
		U8EnableDriveSwitch = ((FIO0PIN >> 6) & 0x01); // P0.6
		U8PosnVelModeSwitch = ((FIO0PIN >> 9) & 0x01); // P0.9
		//U8Spare1 = ((FIO0PIN >> 8) & 0x01); // P0.8
		//U8Spare2 = ((FIO0PIN >> 7) & 0x01); // P0.7


		// Set LED's to blink if drive is interlocked
		if( (vertAxisStruct.U8VelocityNeutral > 0) | (vertAxisStruct.U8PositionNeutral > 0) ){
			U8VertLedState = LED_ON;
		}else{
			U8VertLedState = LED_BLINK;
		}
		if( (latAxisStruct.U8VelocityNeutral > 0) | (latAxisStruct.U8PositionNeutral > 0) ){
			U8LatLedState = LED_ON;
		}else{
			U8LatLedState = LED_BLINK;
		}

		// Handle ENABLE on GMD and LEDs on GFE
		if(U8EnableDriveSwitch > 0){
			// Turn ON enable
			FIO0SET = (1 << 16);
			FIO1SET = (1 << RED_LED_PIN);
			FIO1CLR = (1 << GREEN_LED_PIN);

			// Lock drives if Position / Velocity switch is changed
			if(U8PosnVelModeSwitch != U8PrevPosnVelModeSwitchState){
				vertAxisStruct.U8DriveIsInterlocked = 1;
				latAxisStruct.U8DriveIsInterlocked = 1;
			}

		}else{
			// Otherwise enable is OFF
			FIO0CLR = (1 << 16);
			FIO1CLR = (1 << RED_LED_PIN);
			FIO1SET = (1 << GREEN_LED_PIN);

			// Lock out drives
			vertAxisStruct.U8DriveIsInterlocked = 1;
			latAxisStruct.U8DriveIsInterlocked = 1;
		}
		U8PrevPosnVelModeSwitchState = U8PosnVelModeSwitch;

		// Set Gains
		vertAxisStruct.U16PositionPGain = 10;
		vertAxisStruct.U16PositionIGain = 15;
		vertAxisStruct.U16PositionDGain = 0;

		latAxisStruct.U16PositionPGain = 2;
		latAxisStruct.U16PositionIGain = 0;
		latAxisStruct.U16PositionDGain = 0;

		// Set limits
		vertAxisStruct.U16CommandLimit = VERTICAL_COMMAND_LIMIT;
		vertAxisStruct.U16HighPosnLimit = 800;
		vertAxisStruct.U16LowPosnLimit = 130;
		latAxisStruct.U16CommandLimit = LATERAL_COMMAND_LIMIT;
		latAxisStruct.U16HighPosnLimit = 800;
		latAxisStruct.U16LowPosnLimit = 300;

		// Set mode
		vertAxisStruct.U8PosnVelMode = U8PosnVelModeSwitch;
		latAxisStruct.U8PosnVelMode = U8PosnVelModeSwitch;

		// Run control loops
		controlLoop(&vertAxisStruct);
		controlLoop(&latAxisStruct);

		// Set vertical axis PWM's
		if(vertAxisStruct.S16OutputCommand > 0){ //Forward
			// Compute ON time scaled 0 - 511 counts
			// Can't go to 100% DC, so max is 98%, or 958
			u32Temp = ((uint32_t)(vertAxisStruct.S16OutputCommand * (2 * 958))) / 1000;
			pwmSetOnTimeSingleEdge(PWM1_5, microsecondsToPWMTicks( u32Temp )); // U-Pole, short lead
			pwmSetOnTimeSingleEdge(PWM1_6, microsecondsToPWMTicks( 0 )); // V-Pole, short lead
		}else{ // Reverse
			// Compute ON time scaled 0 - 511 counts
			// Can't go to 100% DC, so max is 98%, or 958
			u32Temp = ((uint32_t)(vertAxisStruct.S16OutputCommand * (-2 * 958))) / 1000;
			pwmSetOnTimeSingleEdge(PWM1_5, microsecondsToPWMTicks( 0 )); // U-Pole, short lead
			pwmSetOnTimeSingleEdge(PWM1_6, microsecondsToPWMTicks( u32Temp )); // V-Pole, short lead
		}

		// Set lateral axis PWM's
		if(latAxisStruct.S16OutputCommand > 0){ //Forward
			// Compute ON time scaled 0 - 511 counts
			// Can't go to 100% DC, so max is 98%, or 958
			u32Temp = ((uint32_t)(latAxisStruct.S16OutputCommand * (2 * 958))) / 1000;
			pwmSetOnTimeSingleEdge(PWM1_3, microsecondsToPWMTicks( u32Temp )); // U-Pole, long lead
			pwmSetOnTimeSingleEdge(PWM1_2, microsecondsToPWMTicks( 0 )); // V-Pole, long lead
		}else{ // Reverse
			// Compute ON time scaled 0 - 511 counts
			// Can't go to 100% DC, so max is 98%, or 958
			u32Temp = ((uint32_t)(latAxisStruct.S16OutputCommand * (-2 * 958))) / 1000;
			pwmSetOnTimeSingleEdge(PWM1_3, microsecondsToPWMTicks( 0 )); // U-Pole, long lead
			pwmSetOnTimeSingleEdge(PWM1_2, microsecondsToPWMTicks( u32Temp )); // V-Pole, long lead
		}

		processLeds();

		// Handle HW Watchdog on GMD
		if(u8WatchDogCycleCount > 18){
			u8WatchDogCycleCount = 0;
			if(u8WatchDogToggle > 0){
				u8WatchDogToggle = 0;
				FIO0CLR = (1 << 17); // WDT output OFF
			}else{
				u8WatchDogToggle = 1;
				FIO0SET = (1 << 17); // WDT output ON
			}
		}else{
			u8WatchDogCycleCount++;
		}



	} // End for(;;)
	while(1);

	return(0);

}


/******************************************************************************
 * Function name:		processLeds
 *
 * Description:			Manages LEDs based on system state
 *****************************************************************************/
void processLeds(void){
	// Handle LED timer operation
	if(u32LedCount > 50){
		u32LedCount = 0;
		U8LedState = ~U8LedState;
	}else{
		u32LedCount++;
	}

	// Process Vertical LED on P1.23
	switch(U8VertLedState){
	case LED_OFF:
		FIO1CLR = (1<<23);
		break;
	case LED_ON:
		FIO1SET = (1<<23);
		break;
	case LED_BLINK:
		if(U8LedState){FIO1SET = (1<<23);}
		else{FIO1CLR = (1<<23);}
		break;
	}

	// Process Lateral LED on P1.24
	switch(U8LatLedState){
	case LED_OFF:
		FIO1CLR = (1<<24);
		break;
	case LED_ON:
		FIO1SET = (1<<24);
		break;
	case LED_BLINK:
		if(U8LedState){FIO1SET = (1<<24);}
		else{FIO1CLR = (1<<24);}
		break;
	}

	// Process Posn / Vel LEDs on P1.26 and P1.27
	if(U8PosnVelModeSwitch > 0){
		FIO1SET = (1 << 26);
		FIO1CLR = (1 << 27);
	}else{
		FIO1CLR = (1 << 26);
		FIO1SET = (1 << 27);
	}
}


/******************************************************************************
 * Function name:		targetInit
 *
 * Description:			Resets GRIO to a safe state for *this* application,
 * 						and then sets up pins to intended application mode.
 *****************************************************************************/
void targetInit(void){
	targetGPIOResetPins(); // Set pins to safe state
	targetSetPinsForApplication(); // Set for GFE
}


/******************************************************************************
 * Function name:		microsecondsToPWMTicks
 *
 * Description:			Returns number of PWM ticks in microseconds variable
 *
 *****************************************************************************/
uint32_t microsecondsToPWMTicks(const uint32_t microseconds)
{
	uint32_t ret = (pwmGetPclk() / 1000000) * microseconds;
	return (ret);
}


/******************************************************************************
 * Function name:		nanosecondsToPWMTicks
 *
 * Description:			Returns number of PWM ticks in nanoseconds variable
 *
 *****************************************************************************/
uint32_t nanosecondsToPWMTicks(const uint32_t nanoseconds)
{
	uint32_t ret = (pwmGetPclk() * nanoseconds) / 1000000000;
	return (ret);
}


/******************************************************************************
 * Function name:		install_irq
 *
 * Description:			Sets up a particular interrupt vector so that the
 * 						appropriate handler is called.
 *
 *****************************************************************************/
int install_irq( unsigned char intNumber, void *HandlerAddr, unsigned int Priority, unsigned char intType )
{
    unsigned int *vect_addr;
    unsigned int *vect_cntl;

    VICIntEnClr = 1 << intNumber;	/* Disable Interrupt */
    if ( intNumber >= 32 )
    {
		return ( 0 );
    }
    else
    {
		/* find first un-assigned VIC address for the handler */
//		vect_addr = (unsigned int *)(VIC_BASE_ADDR + VECT_ADDR_INDEX + intNumber*4);
//		vect_cntl = (unsigned int *)(VIC_BASE_ADDR + VECT_CNTL_INDEX + intNumber*4);
		vect_addr = (unsigned int *)(VIC_BASE_ADDR + 0x100 + intNumber*4);
		vect_cntl = (unsigned int *)(VIC_BASE_ADDR + 0x200 + intNumber*4);
		*vect_addr = (unsigned int)HandlerAddr;	/* set interrupt vector */
		*vect_cntl = Priority;
		VICIntEnable = 1 << intNumber;	/* Enable Interrupt */
		VICIntSelect &= ~(intType << intNumber);// Set IRQ(0) category OR
		VICIntSelect |= (intType << intNumber);// Set FIQ(1) category
		return( 1 );
    }
} // End install_irq



/******************************************************************************
 * Function name:		TIMER1Handler
 *
 * Descriptions:		ADC sample ISR executes when timer expires
 *
 * parameters:			None
 * Returned value:		None
 *
 *****************************************************************************/
void TIMER1Handler( void ) __attribute__((naked));
void TIMER1Handler( void ) // "naked" = don't store context
{
	// TODO Find out why variables placed in this ISR break the software?

	// Manually save the context of the interrupted task.
	//portSAVE_CONTEXT();
	// Save context
	asm volatile (
			"SUB		R14, R14, #4			\n\t"
			"STMFD		R13!, {R0-R3,R12,R14}		");

	T1IR = 1; // Clear flag by writing a 1 to the MR0 flag bit

	// Trigger main loop execution
	u8OneMillisecondFlag = 1;

	VICAddress = 0;						// Acknowledge Interrupt

    // Restore context
	asm volatile (
			"LDMFD		R13!, {R0-R3,R12,PC}^		");
    //portRESTORE_CONTEXT();
}

#define PCTIM1			2 // Clock source to timer 1
#define PCLK_TIMER1 	4 //

/******************************************************************************
 * void initTimer1 (void)
 *
 * Description:		Initializes timer 1 for RTOS.
 *
 *****************************************************************************/
void initTimer1 (void)
{
	// Turn on module power and clocking
	PCONP |= (1 << PCTIM1);

	// Set up clocking
	// Set TIM1 Clock = 72MHz / 1 = 72 MHz
	PCLKSEL0 &= ~( 0x03 << PCLK_TIMER1 ); // Clear both bits
	PCLKSEL0 |= ( CCLK_DIV1 << PCLK_TIMER1 ); // Set one bits

	// Stop and reset the timer
	T1TCR  = 2;
	T1CTCR = 0; // Timer mode

	// Set match register with value for 1 kHz rate (36000)
	T1MR0 = 36000;

	// Set up Timer 1 match control register to 1) clear timer 2) interrupt
	T1MCR = (3<<0); // Interrupt on MR0 and reset timer

	T1IR = 1; // Clear flag by writing a 1 to the MR0 flag bit

//	install_irq( TIMER1_INT, (void *)TIMER1Handler, TMR1_PRIORITY, INT_IRQ );
	install_irq( 5, (void *)TIMER1Handler, 2, 0 );

	// Start the timer
	T1TCR = 1;
}
