// main remote code


#include <EFM8LB1.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define SYSCLK 72000000L
#define BAUDRATE 115200L
#define SARCLK 18000000L

#define DEFAULT_F 15500L

#define TIMER_OUT_2 P3_3 //speaker connnect to pin 3.3
#define TIMER_OUT_4 P3_2 //timer 4 pin out

#define VDD 4.85 // The measured value of VDD in volts
#define MAX_VOLT 4.5

// for remote control 
#define control_x QFP32_MUX_P1_4
#define control_y QFP32_MUX_P1_5
//#define speaker QFP32_MUX_P0_4

#define LCD_RS P1_7
// #define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_5
#define LCD_D4 P1_3
#define LCD_D5 P1_2
#define LCD_D6 P1_1
#define LCD_D7 P1_0
#define CHARS_PER_LINE 16

#define METAL_DECTECT P2_6

#define PCA_OUT_4   P0_6
#define PCA_4_FREQ 11000L
#define TIMER_4_FREQ 5000L


idata char buff[20];

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
	
	P0MDOUT |= 0x11; // Enable UART0 TX (P0.4) and UART1 TX (P0.0) as push-pull outputs
	P2MDOUT |= 0x01; // P2.0 in push-pull mode
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X00;
	XBR2     = 0x41; // Enable crossbar and uart 1
	// Configure the pins used for square output
	// P2MDOUT|=0x11;
	// P0MDOUT |= 0x01; // Enable UART0 TX as push-pull output
	// XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	// XBR1     = 0X00; 
	// XBR2     = 0x41; // Enable crossbar and weak pull-ups
	// P2MDOUT|=0b_0000_0011;
	// P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	// XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	// XBR1     = 0x10; // Enable T0 on P0.0
	// XBR2     = 0x40; // Enable crossbar and weak pull-ups

	// Configure Uart 0
	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	//Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2
	EA=1; // Global interrupt enable


	// // Initialize timer 4 for periodic interrupts
	// SFRPAGE=0x10;
	// TMR4CN0=0x00;   // Stop Timer4; Clear TF4; WARNING: lives in SFR page 0x10
	// CKCON1|=0b_0000_0001; // Timer 4 uses the system clock
	// TMR4RL=(0x10000L-(SYSCLK/(2*TIMER_4_FREQ))); // Initialize reload value
	// TMR4=0xffff;   // Set to reload immediately
	// EIE2|=0b_0000_0100;     // Enable Timer4 interrupts
	// TR4=1;
  	
	return 0;
}

// void Timer4_ISR (void) interrupt INTERRUPT_TIMER4
// {
// 	SFRPAGE=0x10;
// 	TF4H = 0; // Clear Timer4 interrupt flag
// 	TIMER_OUT_4=!TIMER_OUT_4;
// }

void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{
	SFRPAGE=0x0;
	TF2H = 0; // Clear Timer2 interrupt flag
	TIMER_OUT_2=!TIMER_OUT_2;
}

void InitADC (void)
{
	SFRPAGE = 0x00;
	ADEN=0; // Disable ADC
	
	ADC0CN1=
		(0x2 << 6) | // 0x0: 10-bit, 0x1: 12-bit, 0x2: 14-bit
        (0x0 << 3) | // 0x0: No shift. 0x1: Shift right 1 bit. 0x2: Shift right 2 bits. 0x3: Shift right 3 bits.		
		(0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	
	ADC0CF0=
	    ((SYSCLK/SARCLK) << 3) | // SAR Clock Divider. Max is 18MHz. Fsarclk = (Fadcclk) / (ADSC + 1)
		(0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	
	ADC0CF1=
		(0 << 7)   | // 0: Disable low power mode. 1: Enable low power mode.
		(0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	
	ADC0CN0 =
		(0x0 << 7) | // ADEN. 0: Disable ADC0. 1: Enable ADC0.
		(0x0 << 6) | // IPOEN. 0: Keep ADC powered on when ADEN is 1. 1: Power down when ADC is idle.
		(0x0 << 5) | // ADINT. Set by hardware upon completion of a data conversion. Must be cleared by firmware.
		(0x0 << 4) | // ADBUSY. Writing 1 to this bit initiates an ADC conversion when ADCM = 000. This bit should not be polled to indicate when a conversion is complete. Instead, the ADINT bit should be used when polling for conversion completion.
		(0x0 << 3) | // ADWINT. Set by hardware when the contents of ADC0H:ADC0L fall within the window specified by ADC0GTH:ADC0GTL and ADC0LTH:ADC0LTL. Can trigger an interrupt. Must be cleared by firmware.
		(0x0 << 2) | // ADGN (Gain Control). 0x0: PGA gain=1. 0x1: PGA gain=0.75. 0x2: PGA gain=0.5. 0x3: PGA gain=0.25.
		(0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.

	ADC0CF2= 
		(0x0 << 7) | // GNDSL. 0: reference is the GND pin. 1: reference is the AGND pin.
		(0x1 << 5) | // REFSL. 0x0: VREF pin (external or on-chip). 0x1: VDD pin. 0x2: 1.8V. 0x3: internal voltage reference.
		(0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	
	ADC0CN2 =
		(0x0 << 7) | // PACEN. 0x0: The ADC accumulator is over-written.  0x1: The ADC accumulator adds to results.
		(0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3

	ADEN=1; // Enable ADC
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

void TIMER0_Init(void)
{
	TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	TR0=0; // Stop Timer/Counter 0
}


// initalize timer2 for speaker

// void TIMER2_Init(void){
// 	// Initialize timer 2 for periodic interrupts
// 	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
// 	CKCON0|=0b_0001_0000;
// 	TMR2RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
// 	TMR2=0xffff;   // Set to reload immediately
// 	ET2=1;         // Enable Timer2 interrupts
// 	TR2=1;         // Start Timer2
// 	EA=1; // Global interrupt enable
// }


void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

void InitPinADC (unsigned char portno, unsigned char pinno)
{
	unsigned char mask;
	
	mask=1<<pinno;

	SFRPAGE = 0x20;
	switch (portno)
	{
		case 0:
			P0MDIN &= (~mask); // Set pin as analog input
			P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 1:
			P1MDIN &= (~mask); // Set pin as analog input
			P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 2:
			P2MDIN &= (~mask); // Set pin as analog input
			P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		default:
		break;
	}
	SFRPAGE = 0x00;
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	ADC0MX = pin;   // Select input from pin
	ADINT = 0;
	ADBUSY = 1;     // Convert voltage at the pin
	while (!ADINT); // Wait for conversion to complete
	return (ADC0);
}

unsigned int Get_ADC (void)
{
    ADINT = 0;
    ADBUSY = 1;
    while (!ADINT); // Wait for conversion to complete
    return (ADC0);
}


float Volts_at_Pin(unsigned char pin)
{
	 return ((ADC_at_Pin(pin)*VDD)/16383);
}

void UART1_Init (unsigned long baudrate)
{
    SFRPAGE = 0x20;
	SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	SCON1 = 0x10;
	SBCON1 =0x00;   // disable baud rate generator
	SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
	TI1 = 1; // indicate ready for TX
	SBCON1 |= 0x40;   // enable baud rate generator
	SFRPAGE = 0x00;
}

void putchar1 (char c) 
{
    SFRPAGE = 0x20;
	while (!TI1);
	TI1=0;
	SBUF1 = c;
	SFRPAGE = 0x00;
}

void sendstr1 (char * s)
{
	while(*s)
	{
		putchar1(*s);
		s++;	
	}
}

char getchar1 (void)
{
	char c;
    SFRPAGE = 0x20;
	while (!RI1);
	RI1=0;
	// Clear Overrun and Parity error flags 
	SCON1&=0b_0011_1111;
	c = SBUF1;
	SFRPAGE = 0x00;
	return (c);
}

char getchar1_with_timeout (void)
{
	char c;
	unsigned int timeout;
    SFRPAGE = 0x20;
    timeout=0;
	while (!RI1)
	{
		SFRPAGE = 0x00;
		Timer3us(20);
		SFRPAGE = 0x20;
		timeout++;
		if(timeout==25000)
		{
			SFRPAGE = 0x00;
			return ('\n'); // Timeout after half second
		}
	}
	RI1=0;
	// Clear Overrun and Parity error flags 
	SCON1&=0b_0011_1111;
	c = SBUF1;
	SFRPAGE = 0x00;
	return (c);
}

void getstr1 (char * s)
{
	char c;
	
	while(1)
	{
		c=getchar1_with_timeout();
		if(c=='\n')
		{
			*s= 0; //was 0
			return;
		}
		*s=c;
		s++;
	}
}

// RXU1 returns '1' if there is a byte available in the receive buffer of UART1
bit RXU1 (void)
{
	bit mybit;
    SFRPAGE = 0x20;
	mybit=RI1;
	SFRPAGE = 0x00;
	return mybit;
}

void waitms_or_RI1 (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
	{
		for (k=0; k<4; k++)
		{
			if(RXU1()) return;
			Timer3us(250);
		}
	}
}

void SendATCommand (char * s)
{
	printf("Command: %s", s);
	P2_0=0; // 'set' pin to 0 is 'AT' mode.
	sendstr1(s);
	getstr1(buff);
	waitms(10);
	P2_0=1; // 'set' pin to 1 is normal operation mode.
	printf("Response: %s\r\n", buff);
}

//LCD stuff

void LCD_pulse (void)
{
	LCD_E=1;
	Timer3us(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	Timer3us(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void speaker_pulse(void) 
{
	METAL_DECTECT = 0;
	waitms(50);
	METAL_DECTECT = 1;
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	Timer3us(40);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	Timer3us(40);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	// LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	Timer3us(40);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

void LCDprint2(char * string, unsigned char line, unsigned char col)
{
	int j;

	WriteCommand(line==2?0xc0|col:0x80|col); // Move cursor to line and column
	for(j=0; string[j]!=0; j++) WriteData(string[j]); // Write the message
}

void thefastestsprintf (int num, char str[], int index) {
	//int index = 5;
	int i = 3;
	str[index] = '\0';

	for (i = 3; i > 0; i--) {

		if (index < 0) {
			break;
		}
		str[index -1] = num % 10 + '0';
		num/=10;
		index--;
	}
	
	return;
}

void LCD_build_left(void){
	WriteCommand(0x48);       //Load the location where we want to store
	WriteData(0x1f);      //Load row 1 data
	WriteData(0x10);      //Load row 2 data
	WriteData(0x13);      //Load row 3 data
	WriteData(0x17);      //Load row 4 data
	WriteData(0x17);      //Load row 5 data
	WriteData(0x13);      //Load row 6 data
	WriteData(0x10);      //Load row 7 data
	WriteData(0x1f);      //Load row 8 data
}

void LCD_build_right(void){
	WriteCommand(0x50);       //Load the location where we want to store
	WriteData(0x1f);      //Load row 1 data
	WriteData(0x1);      //Load row 2 data
	WriteData(0x1d);      //Load row 3 data
	WriteData(0x1d);      //Load row 4 data
	WriteData(0x1d);      //Load row 5 data
	WriteData(0x1d);      //Load row 6 data
	WriteData(0x1);      //Load row 7 data
	WriteData(0x1f);      //Load row 8 data
}


void LCD_build_mid(void){
	WriteCommand(0x58);       //Load the location where we want to store
	WriteData(0x1f);      //Load row 1 data
	WriteData(0x0);      //Load row 2 data
	WriteData(0x1f);      //Load row 3 data
	WriteData(0x1f);      //Load row 4 data
	WriteData(0x1f);      //Load row 5 data
	WriteData(0x1f);      //Load row 6 data
	WriteData(0x0);      //Load row 7 data
	WriteData(0x1f);      //Load row 8 data
}

void LCD_build_left_empty(void){
	WriteCommand(0x60);       //Load the location where we want to store
	WriteData(0x1f);      //Load row 1 data
	WriteData(0x10);      //Load row 2 data
	WriteData(0x10);      //Load row 3 data
	WriteData(0x10);      //Load row 4 data
	WriteData(0x10);      //Load row 5 data
	WriteData(0x10);      //Load row 6 data
	WriteData(0x10);      //Load row 7 data
	WriteData(0x1f);      //Load row 8 data
}

void LCD_build_mid_empty(void){
	WriteCommand(0x68);       //Load the location where we want to store
	WriteData(0x1f);      //Load row 1 data
	WriteData(0x10);      //Load row 2 data
	WriteData(0x00);      //Load row 3 data
	WriteData(0x00);      //Load row 4 data
	WriteData(0x00);      //Load row 5 data
	WriteData(0x00);      //Load row 6 data
	WriteData(0x00);      //Load row 7 data
	WriteData(0x1f);      //Load row 8 data
}

void LCD_build_right_empty(void){
	WriteCommand(0x70);       //Load the location where we want to store
	WriteData(0x1f);      //Load row 1 data
	WriteData(0x1);      //Load row 2 data
	WriteData(0x1);      //Load row 3 data
	WriteData(0x1);      //Load row 4 data
	WriteData(0x1);      //Load row 5 data
	WriteData(0x1);      //Load row 6 data
	WriteData(0x1);      //Load row 7 data
	WriteData(0x1f);      //Load row 8 data
}


void main (void)
{
	unsigned int cnt;
	unsigned int timeout_cnt;
	unsigned int level,speaker_f;
	int volt_x;
	int volt_y;
	int count = 0;
	int volt_battery, percentage;
	int percentage_buff[2];
	// LCD_build_left();
	// LCD_build_right();
	// LCD_build_mid();


	LCD_4BIT();
	// float strength = 0.0; //display the strengthof the signal of the metal detector in the robot
	// the period of oscillator i assume, nvm i think it's teh same as freqency
	//float frequency;
	//char buff1[17]; // for lcd display
	        //123456789ABCDEFGH
	LCDprint("Strength = x",1,0);
	LCDprint("Battery: xx% ", 2,0);
	// WriteCommand(0xCD);
	// WriteData(1); // For pattern @0x48
	// WriteCommand(0xCE);
	// WriteData(3); // For pattern @0x50
	// WriteCommand(0xCF);
	// WriteData(2); // For pattern @0x48



	// use p1.4 for joystick vry, p1.5 for vrx
	InitADC();
	waitms(500);
	printf("\r\nJDY-40 test\r\n");
	UART1_Init(9600);
	InitPinADC(1,4); //for x remote
	InitPinADC(1,5); //for y remote
	//TIMER2_Init();

	// To configure the device (shown here using default values).
	// For some changes to take effect, the JDY-40 needs to be power cycled.
	// Communication can only happen between devices with the
	// same RFID and DVID in the same channel.
	
	//SendATCommand("AT+BAUD4\r\n");
	//SendATCommand("AT+RFID8899\r\n");
	//SendATCommand("AT+DVID1122\r\n"); // Default device ID.
	//SendATCommand("AT+RFC001\r\n");
	//SendATCommand("AT+POWE9\r\n");
	//SendATCommand("AT+CLSSA0\r\n");
	
	// We should select an unique device ID.  The device ID can be a hex
	// number from 0x0000 to 0xFFFF.  In this case is set to 0xABBA
	SendATCommand("AT+DVID9944\r\n"); 
	SendATCommand("AT+RFID2576\r\n");
	SendATCommand("AT+RFC012\r\n");

	// To check configuration
	SendATCommand("AT+VER\r\n");
	SendATCommand("AT+BAUD\r\n");
	SendATCommand("AT+RFID\r\n");
	SendATCommand("AT+DVID\r\n");
	SendATCommand("AT+RFC\r\n");
	SendATCommand("AT+POWE\r\n");
	SendATCommand("AT+CLSS\r\n");
	
	printf("\r\nPress and hold the BOOT button to transmit.\r\n");
	
	cnt=0;
	timeout_cnt=0;
	// TR2 = 1;
	while(1)
	{	
		//send attention code
		putchar1('M');
		Timer3us(10000); //wait for 10 ms for robot to get attention message
		// read the voltage from the remote control 
		EA=0;
		volt_x = 100*(Volts_at_Pin(QFP32_MUX_P1_4));
		volt_y = 100*(Volts_at_Pin(QFP32_MUX_P1_5));
		volt_battery = Volts_at_Pin(QFP32_MUX_P2_2);
		percentage = 100 * volt_battery / MAX_VOLT;
		EA=1;
		//thefastestsprintf(percentage,percentage_buff,2);
		//printf("%s\r\n",percentage_buff);
		//LCDprint2(percentage_buff, 2, 9);

		//printf("x: %d\r\n",volt_x);
		//printf("y: %d\r\n",volt_y);
		//waitms(200);
		//buff[0]=NULL;
		// after 10ms, send the joystick control data to the robot.
		//sprintf(buff, "%03d|%03d\r\n", volt_x, volt_y); // make sure that each data point is 3 digits
		thefastestsprintf(volt_x,buff,3); 
		buff[3] = '|';
		thefastestsprintf(volt_y,buff,7); 
		//printf("%s\r\n",buff);
		buff[7] = '\r';
		buff[8] = '\n';
		//printf("%d\n",strlen(buff));
		sendstr1(buff);
		printf("%s\r\n",buff);
		
		// timeout
		timeout_cnt=0;
		while(1)
		{
			if(RXU1()) break; // Got something! Get out of loop.
			Timer3us(10); // Check if something has arrived every 10us
			timeout_cnt++;

			if(timeout_cnt>=800) break; // timeout after ms, get out of loop
		} 
		

		// speaker play sounds if metal was detected -> frequency increase
		// frequency get from the robot.
		
		// if read 
		if(RXU1())
		{	
			//get freq level from robot (from lvl 1-6), get them in buffer
			// check if the recive the complete data, else wait longer
			getstr1(buff);	
			//printf("received\r\n");
			//printf("string=%s\r\n",buff);

			level = atoi(&buff[0]);

			// if(level[count] == 1) {
			// 	speaker_pulse();
			// }
			
			if(level >= 0 && level <= 3){ //check if the signal is in the range
				//printf("string=%s\r\n",buff);
				//change string to long int
				
				//printf("%ld\r\n",f);

			//	if (count == 2) {
					
					if(level==3){
						METAL_DECTECT = 0;
					 	speaker_pulse();	
					}
						speaker_f = 200*(level);
						buff[0] = level + '0';
						buff[1] = '\0';
						//printf("%s\r\n",buff);
						LCDprint2(buff,1,11);
						// speaker beeps
						// TR2=0; // Stop timer 2
						TMR2RL=0x10000L-(SYSCLK/(2*speaker_f)); // Change reload value for new frequency
						
						//count = -1;
					
				//}
			}
			//count++;
		}
		//waitms_or_RI1(10);
	}
}