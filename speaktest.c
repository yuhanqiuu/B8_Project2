//  all_timers.c: Uses timer 0 to 5 overflow interrupts to generate a square
//  wave at pins P2.0, P1_7, P1_6, P1_5, P1_4, and P1_3.  Also use the PCA with interrupts to
//  generate square signals at pins P1.2, P1.1, P1.0, P0.7, and P0.6
//
//  Copyright (c) 2010-2018 Jesus Calvino-Fraga
//
//  ~C51~

#include <EFM8LB1.h>
#include <stdlib.h>
#include <stdio.h>

#define SYSCLK 72000000L // SYSCLK frequency in Hz

#define TIMER_2_FREQ 3000L
#define default_metal_freq 57300L

#define TIMER_OUT_2 P1_6

// strength of metal. different level will have the speaker play different frequency
#define Level_1 1000L
#define Level_2 2000L
#define Level_3 3000L
#define Level_4 4000L
#define Level_5 5000L
#define Level_6 6000L
// volatile unsigned int TickCount=0;


//unsigned long int TIMER_2_FREQ = 3000;

char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN=0x80;       // enable VDD monitor
	RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif

	// Configure the pins used for square output
	P0MDOUT|=0b_1100_0010;
	P1MDOUT|=0b_1111_1111;
	P2MDOUT|=0b_0000_0001;
	
	XBR0     = 0x00;                     
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL=(0x10000L-(SYSCLK/(2*TIMER_2_FREQ))); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)

	EA=1; // Enable interrupts
	
	return 0;
}


void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{
	SFRPAGE=0x0;		
	TF2H = 0; // Clear Timer2 interrupt flag
	TIMER_OUT_2=!TIMER_OUT_2;
	
}

unsigned int mapFrequencySpeak(unsigned long int difference)
{
    // Example mapping function
    // This function maps the range of test_freq to a range of speaker frequencies

   if((difference>=500) && (difference<700)){ // speaker plays 3000 freq
			
			speaker_freq = Level_1; //level 1
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
			delay(50000);
			difference =750;
			
		}
		else if((difference>=700) && (difference<800) ){
			speaker_freq = Level_2; //level 2
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2

		}
		else if((difference>=800) && (difference<900) ){
			speaker_freq = Level_3; //level 3
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else if((difference>=900) && (difference<1000) ){
			speaker_freq = Level_4; //level 4
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else if((difference>=1000) && (difference<1100) ){
			speaker_freq = Level_5; //level 5
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else if(difference>=1100){
			speaker_freq = Level_6; //level 6
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else{
			// do nothing
			

		}
	

}

void delay (unsigned int x)
{
	unsigned char j;
	while(--x)
	{
		for(j=0; j<100; j++);
	}
}

void main (void)
{
    unsigned int j;
	unsigned long int test_freq,speaker_freq, difference; //assume test_freq is the freq got robot, speaker_freq default at 3000
	test_freq = 58000; // change this value manually to check for speaker	
	// default_metal_freq = 57300
	//for checking
	difference = 600;
	while(1)
	{		
		//difference = test_freq-default_metal_freq;

		
		//check how much the metal freq increased
		if((difference>=500) && (difference<700)){ // speaker plays 3000 freq
			
			speaker_freq = Level_1; //level 1
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
			delay(50000);
			difference =750;
			
		}
		else if((difference>=700) && (difference<800) ){
			speaker_freq = Level_2; //level 2
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
			delay(50000);
			difference =850;

		}
		else if((difference>=800) && (difference<900) ){
			speaker_freq = Level_3; //level 3
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else if((difference>=900) && (difference<1000) ){
			speaker_freq = Level_4; //level 4
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else if((difference>=1000) && (difference<1100) ){
			speaker_freq = Level_5; //level 5
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else if(difference>=1100){
			speaker_freq = Level_6; //level 6
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-(SYSCLK/(2*speaker_freq)); // Change reload value for new frequency
			TR2=1; // Start timer 2
		}
		else{
			// do nothing
			delay(50000);

		}
	}
}
