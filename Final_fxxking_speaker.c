// EFM8LB1_Receiver.c:  This program implements a simple serial port
// communication protocol to program, verify, and read SPI flash memories.  Since
// the program was developed to store wav audio files, it also allows 
// for the playback of said audio.  It is assumed that the wav sampling rate is
// 22050Hz, 8-bit, mono.
// ~C51~ 

#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>
#include <math.h>
#include <string.h>

#define SYSCLK 72000000L
#define BAUDRATE 115200L
#define TIMER_2_FREQ 22050L  // Must match the frequency of the wav file store in external SPI flash
#define F_SCK_MAX 20000000L  // Max SPI SCK freq (Hz) 
#define CS P0_3

#define FLASH_DATA_ADDRESS 0x55


// Flash memory commands
#define WRITE_ENABLE     0x06  // Address:0 Dummy:0 Num:0 fMax: 25MHz
#define WRITE_DISABLE    0x04  // Address:0 Dummy:0 Num:0 fMax: 25MHz
#define READ_STATUS      0x05  // Address:0 Dummy:0 Num:1 to infinite fMax: 32MHz
#define READ_BYTES       0x03  // Address:3 Dummy:0 Num:1 to infinite fMax: 20MHz
#define READ_SILICON_ID  0xab  // Address:0 Dummy:3 Num:1 to infinite fMax: 32MHz
#define FAST_READ        0x0b  // Address:3 Dummy:1 Num:1 to infinite fMax: 40MHz
#define WRITE_STATUS     0x01  // Address:0 Dummy:0 Num:1 fMax: 25MHz
#define WRITE_BYTES      0x02  // Address:3 Dummy:0 Num:1 to 256 fMax: 25MHz
#define ERASE_ALL        0xc7  // Address:0 Dummy:0 Num:0 fMax: 25MHz
#define ERASE_BLOCK      0xd8  // Address:3 Dummy:0 Num:0 fMax: 25MHz
#define READ_DEVICE_ID   0x9f  // Address:0 Dummy:2 Num:1 to infinite fMax: 25MHz

// SPI Flash Memory connections:
// 	P0.0: SCK  connected to pin 6
// 	P0.1: MISO connected to pin 2
// 	P0.2: MOSI connected to pin 5
//  P0.3: CS*  connected to pin 1
//  3.3V: connected to pins 3, 7, and 8
//  GND:  connected to pin 4

volatile unsigned long int playcnt=0;
volatile unsigned char play_flag=0; // If '1' the timer interrupt plays the sound (in the 8051 it could be a 'bit', but trying to make this as portable as possible)

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

	// Initialize the pin used by DAC0 (P3.0 in the LQFP32 package)
	// 1. Clear the bit associated with the pin in the PnMDIN register to 0. This selects analog mode for the pin.
    // 2. Set the bit associated with the pin in the Pn register to 1.
    // 3. Skip the bit associated with the pin in the PnSKIP register to ensure the crossbar does not attempt to assign a function to the pin.
	P3MDIN&=0b_1111_1110;
	P3|=0b_0000_0001;
	//P3SKIP|=0b_0000_0001; // P3 Pins Not Available on Crossbar
	
	P0MDOUT  = 0b_0001_1101;//SCK, MOSI, P0.3, TX0 are puspull, all others open-drain
	XBR0     = 0b_0000_0011;//SPI0E=1, URT0E=1
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	#if ( ((SYSCLK/BAUDRATE)/(12L*2L)) > 0x100)
		#error Can not configure baudrate using timer 1 
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(12L*2L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
  	// Initialize DAC
	SFRPAGE = 0x30; 
  	DACGCF0=0b_1000_1000; // 1:D23REFSL(VCC) 1:D3AMEN(NORMAL) 2:D3SRC(DAC3H:DAC3L) 1:D01REFSL(VCC) 1:D1AMEN(NORMAL) 1:D1SRC(DAC1H:DAC1L)
  	DACGCF1=0b_0000_0000;
  	DACGCF2=0b_0010_0010; // Reference buffer gain 1/3 for all channels
  	DAC0CF0=0b_1000_0000; // Enable DAC 0
  	DAC0CF1=0b_0000_0010; // DAC gain is 3.  Therefore the overall gain is 1.
  	DAC0=0x80<<4;

	SFRPAGE = 0x00; 

	// SPI inititialization
	SPI0CKR = (SYSCLK/(2*F_SCK_MAX))-1;
	SPI0CFG = 0b_0100_0000; //SPI in master mode
	SPI0CN0 = 0b_0000_0001; //SPI enabled and in three wire mode
	CS=1;

	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL=(0x10000L-(SYSCLK/TIMER_2_FREQ)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)

	EA=1; // Enable interrupts
  		
	return 0;
}

unsigned char uart_getc (void)
{
	char c;
	while (!RI);
	RI=0;
	c=SBUF;
	return c;
}

void uart_putc (unsigned char c)
{
	while (!TI);
	TI=0;
	SBUF=c;
}

unsigned char SPIWrite (unsigned char x)
{
   SPI0DAT=x;
   while(!SPIF);
   SPIF=0;
   return SPI0DAT;
}

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{
	unsigned char x;
	
	unsigned int flashAddress = FLASH_DATA_ADDRESS;
	SFRPAGE=0x0;
	TF2H = 0; // Clear Timer2 interrupt flag

	if (play_flag==1)
	{
		if(playcnt==0) // Done playing?
		{
			CS=1; 
			play_flag=0;
		}
		else
		{
			x=SPIWrite(flashAddress);
			SFRPAGE = 0x30;
			DAC0=x<<4;
			playcnt--;
			flashAddress++;
		}
	}
}

void Start_Playback (unsigned long int address, unsigned long int numb)
{
	play_flag=0;
	CS=1;

    CS=0;
    SPIWrite(READ_BYTES);
    SPIWrite((unsigned char)((address>>16)&0xff));
    SPIWrite((unsigned char)((address>>8)&0xff));
    SPIWrite((unsigned char)(address&0xff));
    playcnt=numb;
    play_flag=1;
}

void Enable_Write (void)
{
    CS=0;
    SPIWrite(WRITE_ENABLE);
    CS=1;
}


void main (void)
{
    //unsigned char c;
	playcnt=0;
	play_flag=0;
	CS=1;
      
	while(1)
	{
		if(P3_2==0) // Check if the button between P3.2 is pressed

			{

				waitms(50); // De-bounce

				if(P3_2==0)

				{

					while(P3_2==0); // Wait for push-button release

					//case '0': // Identify command
				    // CS=0;
				    // SPIWrite(READ_DEVICE_ID);
				    // c=SPIWrite((unsigned char)(0xff));
				    // uart_putc(c);
				    // c=SPIWrite((unsigned char)(0xff));
				    // uart_putc(c);
				    // c=SPIWrite((unsigned char)(0xff));
				    // uart_putc(c);
				    // CS=1;

					CS=0;
				    SPIWrite(READ_DEVICE_ID);
				    SPIWrite((unsigned char)(0xff));
				    SPIWrite((unsigned char)(0xff));
				    SPIWrite((unsigned char)(0xff));
				    CS=1;
							
					Start_Playback(0x000000, 0x400000);

				}

			}


		
		
		// c=uart_getc();

		// if(c=='#')
		// {
		// 	playcnt=0;
		// 	play_flag=1; // Stop previous playback if any
		// 	CS=1;
					
		// 	c=uart_getc();
		// 	switch(c)
		// 	{
		// 		case '0': // Identify command
		// 		    CS=0;
		// 		    SPIWrite(READ_DEVICE_ID);
		// 		    c=SPIWrite((unsigned char)(0xff));
		// 		    uart_putc(c);
		// 		    c=SPIWrite((unsigned char)(0xff));
		// 		    uart_putc(c);
		// 		    c=SPIWrite((unsigned char)(0xff));
		// 		    uart_putc(c);
		// 		    CS=1;
		// 		break;			
				
		// 		case '4': // Playback a portion of the stored wav file
		// 			// Get the start position		
		// 			Start_Playback(0x000000, 0x400000);
		// 		break;
				
		// 	}
		
    }  
}	
