
/* Copyright (C) 2011 PSAS.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */

#include "lpc23xx.h"
#include "lpc23xx-pwm.h"
#include "lpc23xx-pll.h"

static uint32_t		u32Pwm1PcrState;
static uint32_t		pwm_pclk = 0;


/******************************************************************************
 * This function is used to configure a *Single Edge* PWM by setting the
 * CCLK_DIV, PWM pre-scaler, and period of the PWM signal. The period is in
 * the PWMMR0 register, and the prescaler in PWMPR register.
 *
 * All channels are disabled after call. pwmSetMatchControlReg and
 * pwmSetChannelState must be called to start PWM outputs.
 *
 *****************************************************************************/
void pwmInitSingleEdge(pclk_scale pclkScale, const uint32_t pwmPrescaler,
		const uint32_t periodTicks)
{
    Freq		cclk;
    int			index;


	// Get cclk frequency based on oscillator and crystal settings
    cclk = pllquery_cclk_mhz();

    switch(pclkScale) {
        case CCLK_DIV1:
        	PCLKSEL0 = (PCLKSEL0 & ~(1<<12)) | (1<<12);
            pwm_pclk = cclk;
            break;
        case CCLK_DIV2:
        	PCLKSEL0 = (PCLKSEL0 & ~(2<<12)) | (2<<12);
            pwm_pclk = cclk/2;
            break;
        case CCLK_DIV4:
        	PCLKSEL0 = (PCLKSEL0 & ~(0<<12)) | (0<<12);
            pwm_pclk = cclk/4;
            break;
        case CCLK_DIV8:
        	PCLKSEL0 = (PCLKSEL0 & ~(3<<12)) | (3<<12);
            pwm_pclk = cclk/8;
            break;
        default:
#ifdef DEBUG_PWM
            printf_lpc(UART0,"Bad choice for scale value.\n");
#endif
            break;
    }

    // Load prescaler
	PWM1PR = pwmPrescaler;

	// Make sure PWM is powered on.
	PCONP |= (1<<6);

	// Disable pwm outputs in PWM Control Register
	for (index = 9; index <= 14; index++) {
		PWM1PCR &= ~(1<<index);
	}

	// Select single edge control in PWM Control Register
	for (index = 2; index <= 6; index++) {
		PWM1PCR &= ~(1<<index);
	}

	// Store state of PWM1PCR for re-enabling later
	u32Pwm1PcrState = PWM1PCR;

	//PWMMCR = PWMMR0R_BIT;
	// Disable interrupts in match control register
	PWM1MCR = 0x0; //clear everything

	// Set period to automatically restart upon timer expiration
	pwmSetMatchControlReg(PWM1_0, false, true, false);

	// Set the period (1/freq) value. PWM1_0 is period in single PWM mode
	pwmSetOnTimeSingleEdge(PWM1_0, periodTicks);

	// Set count source to timers (instead of pins, as a counter would use)
	PWM1CTCR = 0x00000000;

	PWM1TCR = 0x00000002;// Reset counter and prescaler
	PWM1TCR = 0x00000009;// Enable counter and PWM, release counter from reset
} // End void pwmInitSingleEdge(...)



/******************************************************************************
 * chan - The channel that you want to set
 * interrupt - If true, an interrupt is generated on PWM state transition
 * reset - If true, the PWM cycle starts over again after period elapses
 * stop - stops the PWM at the end of the cycle
 *
 *****************************************************************************/
void pwmSetMatchControlReg(const enum PWM_Channel chan, const bool interrupt,
		const bool reset, const bool stop) {
	// See page 261 of the user manual
	uint8_t bitSelect = (1<<0);

	// Set bitselect to appropriate channel (3 bits wide each)
	bitSelect = (chan * 3);

	// Set interrupt bit on channel x
	if( interrupt ) {
		PWM1MCR |= ((uint32_t)1 << bitSelect);
	} else {
		PWM1MCR &= ~((uint32_t)1 << bitSelect);
	}

	// Set reset bit on channel x
	bitSelect++;
	if( reset ) {
		PWM1MCR |= ((uint32_t)1 << bitSelect);
	} else {
		PWM1MCR &= ~((uint32_t)1 << bitSelect);
	}

	// Set stop bit on channel x
	bitSelect++;
	if( stop ) {
		PWM1MCR |= ((uint32_t)1 << bitSelect);
	} else {
		PWM1MCR &= ~((uint32_t)1 << bitSelect);
	}
} // End void pwmSetMatchControlReg(...)



/******************************************************************************
 * This function is used to turn a particular single edge PWM channel on or
 * off. Channel is turned off before on, so don't call it repeatedly or a
 * short glitch can occur once in a while.
 *
 *****************************************************************************/
void pwmSetChannelState(const enum PWM_Channel chan, const bool onOffState)
{
	switch(chan) {
		case(PWM1_0):
			//this is not an actual output
			break;
		case(PWM1_1):
			PWM1PCR &= ~(1 << 9); // Disable PWM Output
			PWM1PCR |= ((uint32_t)onOffState << 9); // Enable PWM Output
			break;
		case(PWM1_2):
			PWM1PCR &= ~(1 << 10); // Disable PWM Output
			PWM1PCR |= ((uint32_t)onOffState << 10); // Enable PWM Output
			break;
		case(PWM1_3):
			PWM1PCR &= ~(1 << 11); // Disable PWM Output
			PWM1PCR |= ((uint32_t)onOffState << 11); // Enable PWM Output
			break;
		case(PWM1_4):
			PWM1PCR &= ~(1 << 12); // Disable PWM Output
			PWM1PCR |= ((uint32_t)onOffState << 12); // Enable PWM Output
			break;
		case(PWM1_5):
			PWM1PCR &= ~(1 << 13); // Disable PWM Output
			PWM1PCR |= ((uint32_t)onOffState << 13); // Enable PWM Output
			break;
		case(PWM1_6):
			PWM1PCR &= ~(1 << 14); // Disable PWM Output
			PWM1PCR |= ((uint32_t)onOffState << 14); // Enable PWM Output
			break;
	}
	u32Pwm1PcrState = PWM1PCR;
} // End void pwmSetChannelState(...)



/******************************************************************************
 * Sets the on-time (in ticks) that the PWM signal will be high. Sets single
 * edge, continuous mode. PWM_Channel PWM1_0 sets the period (frequency), and
 * PWM_Channel PWM1_1 - PWM1_6 set the on-time (duty cycle) of each of the 6
 * PWM channels.
 *
 * Dual edge PWM requires simultaneous writes to 2 bits in the latch enable
 * register, so this should not be used for dual edge PWM.
 *****************************************************************************/
void pwmSetOnTimeSingleEdge(const enum PWM_Channel chan,
		const uint32_t onTimeTicks) {
	switch(chan) {
		case(PWM1_0):
			PWM1MR0 = onTimeTicks;
			PWM1LER |= (1<<0); // Re-latch the register values (continuous)
			break;
		case(PWM1_1):
			PWM1MR1 = onTimeTicks;
			PWM1LER |= (1<<1); // Re-latch the register values (continuous)
			break;
		case(PWM1_2):
			PWM1MR2 = onTimeTicks;
			PWM1LER |= (1<<2); // Re-latch the register values (continuous)
			break;
		case(PWM1_3):
			PWM1MR3 = onTimeTicks;
			PWM1LER |= (1<<3); // Re-latch the register values (continuous)
			break;
		case(PWM1_4):
			PWM1MR4 = onTimeTicks;
			PWM1LER |= (1<<4); // Re-latch the register values (continuous)
			break;
		case(PWM1_5):
			PWM1MR5 = onTimeTicks;
			PWM1LER |= (1<<5); // Re-latch the register values (continuous)
			break;
		case(PWM1_6):
			PWM1MR6 = onTimeTicks;
			PWM1LER |= (1<<6); // Re-latch the register values (continuous)
			break;
	}
} // End void pwmSetOnTimeSingleEdge(...)



/******************************************************************************
 * Returns PWM pclk rate so that frequency and duty cycle can be computed.
 *
 *
 *****************************************************************************/
uint32_t pwmGetPclk(void)
{
	return pwm_pclk;
}



/******************************************************************************
 * Turns off the PWM outputs.
 *
 *
 *****************************************************************************/
void pwmDisableAll( void )
{
	PWM1PCR = 0x00000000;
}



/******************************************************************************
 * Turns PWM outputs back ON.
 *
 * PWM must have been previously initialized
 *****************************************************************************/
void pwmReEnableAll( void )
{
	PWM1PCR = u32Pwm1PcrState;
}

