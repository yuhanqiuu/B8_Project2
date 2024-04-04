#include <XC.h>
#include <sys/attribs.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* Pinout for DIP28 PIC32MX130:
                                          --------
                                   MCLR -|1     28|- AVDD 
  VREF+/CVREF+/AN0/C3INC/RPA0/CTED1/RA0 -|2     27|- AVSS 
        VREF-/CVREF-/AN1/RPA1/CTED2/RA1 -|3     26|- AN9/C3INA/RPB15/SCK2/CTED6/PMCS1/RB15
   PGED1/AN2/C1IND/C2INB/C3IND/RPB0/RB0 -|4     25|- CVREFOUT/AN10/C3INB/RPB14/SCK1/CTED5/PMWR/RB14
  PGEC1/AN3/C1INC/C2INA/RPB1/CTED12/RB1 -|5     24|- AN11/RPB13/CTPLS/PMRD/RB13
   AN4/C1INB/C2IND/RPB2/SDA2/CTED13/RB2 -|6     23|- AN12/PMD0/RB12
     AN5/C1INA/C2INC/RTCC/RPB3/SCL2/RB3 -|7     22|- PGEC2/TMS/RPB11/PMD1/RB11
                                    VSS -|8     21|- PGED2/RPB10/CTED11/PMD2/RB10
                     OSC1/CLKI/RPA2/RA2 -|9     20|- VCAP
                OSC2/CLKO/RPA3/PMA0/RA3 -|10    19|- VSS
                         SOSCI/RPB4/RB4 -|11    18|- TDO/RPB9/SDA1/CTED4/PMD3/RB9
         SOSCO/RPA4/T1CK/CTED9/PMA1/RA4 -|12    17|- TCK/RPB8/SCL1/CTED10/PMD4/RB8
                                    VDD -|13    16|- TDI/RPB7/CTED3/PMD5/INT0/RB7
                    PGED3/RPB5/PMD7/RB5 -|14    15|- PGEC3/RPB6/PMD6/RB6
                                          --------
*/

 
// Configuration Bits (somehow XC32 takes care of this)
#pragma config FNOSC = FRCPLL       // Internal Fast RC oscillator (8 MHz) w/ PLL
#pragma config FPLLIDIV = DIV_2     // Divide FRC before PLL (now 4 MHz)
#pragma config FPLLMUL = MUL_20     // PLL Multiply (now 80 MHz)
#pragma config FPLLODIV = DIV_2     // Divide After PLL (now 40 MHz) 
#pragma config FWDTEN = OFF         // Watchdog Timer Disabled
#pragma config FPBDIV = DIV_1       // PBCLK = SYCLK
#pragma config FSOSCEN = OFF        // Turn off secondary oscillator on A4 and B4

// Defines
#define SYSCLK 40000000L
#define DEF_FREQ 16000L
#define FREQ 100000L // We need the ISR for timer 1 every 10 us
#define Baud2BRG(desired_baud)( (SYSCLK / (16*desired_baud))-1)
#define Baud1BRG(desired_baud)( (SYSCLK / (16*desired_baud))-1)
#define MAX_VOLT 343.6539

volatile int ISR_pwm1=0, ISR_pwm2=0, ISR_cnt=0;

// The Interrupt Service Routine for timer 1 is used to generate one or more standard
// hobby servo signals.  The servo signal has a fixed period of 20ms and a pulse width
// between 0.6ms and 2.4ms.
void __ISR(_TIMER_1_VECTOR, IPL5SOFT) Timer1_Handler(void)
{
	IFS0CLR=_IFS0_T1IF_MASK; // Clear timer 1 interrupt flag, bit 4 of IFS0

	ISR_cnt++;
	if(ISR_cnt<ISR_pwm1&&ISR_pwm1>0)
	{
		LATAbits.LATA0 = 1;
		LATAbits.LATA1 = 0;
	}else if(ISR_pwm1<0&&ISR_cnt<(-1*ISR_pwm1)){
		LATAbits.LATA0 = 0;
		LATAbits.LATA1 = 1;
	}else{
		LATAbits.LATA0 = 0;
		LATAbits.LATA1 = 0;
	}
	if(ISR_cnt<ISR_pwm2&&ISR_pwm2>0)
	{
		LATBbits.LATB0 = 1;
		LATAbits.LATA2 = 0;
	}else if(ISR_pwm2<0&&ISR_cnt<(-1*ISR_pwm2)){
		LATBbits.LATB0 = 0;
		LATAbits.LATA2 = 1;
	}else{
		LATBbits.LATB0 = 0;
		LATAbits.LATA2 = 0;
	}
	if(ISR_cnt>=10000)
	{
		ISR_cnt=0; // 10000 * 10us=100ms
		LATAbits.LATA0 = 0;
		LATAbits.LATA1 = 0;
		LATBbits.LATB0 = 0;
		LATAbits.LATA2 = 0;
	}
}

void pwmcalc (int x, int y, int arr[]) { // arr[0] = pwm1/right; arr[1] = pwm2/left
	//joystick is in the middle (should not move) 
	if(x >= 230 && x <= 250 && y <= 250 && y >= 230){
        arr[0] = 0;
        arr[1] = 0;
    }else if(x > 250 && y <= 250 && y >= 235){ //joystick at east direction
        arr[0] = -10000;
		arr[1] = 10000;
    }else if(x > 250 && y > 250){ //joystick at north-east direction
        arr[0] = 5000;
		arr[1] = 10000;
    }else if(x >= 230 && x <= 250 && y > 250){ //joystick at north direction
        arr[0] = 10000;
		arr[1] = 10000;
    }
	else if(x < 230 && y > 250){ //joystick at north-west direction
        arr[0] = 10000;
		arr[1] = 5000;
    }
	else if(x < 230 && y <= 250 && y >= 230 ){ //joystick at west direction
        arr[0] = 10000;
		arr[1] = -10000;
    }
	else if(x < 230 && y < 230 ){ //joystick at south-west direction
        arr[0] = -10000; //right should be max negative
		arr[1] = -5000; //left should be half of max negative(backward direction)
    }
	else if(x >= 230 && x <= 250 && y < 230 ){ //joystick at south direction
        arr[0] = -10000;
		arr[1] = -10000;
    }
	else if(x >250 && y < 230 ){ //joystick at south-east direction
        arr[0] = -5000;
		arr[1] = -10000;
    }

	//x=238 and y=242 are the centre coordinates
    float normx = x - 238.0;
	float normy = y - 242.0;
	float norm = sqrtf((normx*normx)+(normy*normy));
    arr[0] = norm/MAX_VOLT*arr[0];
    arr[1] = norm/MAX_VOLT*arr[1];
    
	return;
}

void thefastestsprintf (int num, char str[]) {
	int index = 5;
	str[index] = '\r';
	str[index+1] = '\n';
	str[index+2] = '\0';
	while (num > 0){
		str[index-1] = num % 10 + '0';
		num/=10;
		index--;
	}
	
	return;
}

void SetupTimer1 (void)
{
	// Explanation here: https://www.youtube.com/watch?v=bu6TTZHnMPY
	__builtin_disable_interrupts();
	PR1 =(SYSCLK/FREQ)-1; // since SYSCLK/FREQ = PS*(PR1+1)
	TMR1 = 0;
	T1CONbits.TCKPS = 0; // 3=1:256 prescale value, 2=1:64 prescale value, 1=1:8 prescale value, 0=1:1 prescale value
	T1CONbits.TCS = 0; // Clock source
	T1CONbits.ON = 1;
	IPC1bits.T1IP = 5;
	IPC1bits.T1IS = 0;
	IFS0bits.T1IF = 0;
	IEC0bits.T1IE = 1;
	
	INTCONbits.MVEC = 1; //Int multi-vector
	__builtin_enable_interrupts();
}

// Uses Timer4 to delay <us> microseconds
void Timer4us(unsigned char t) 
{
	T4CON = 0x8000; // enable Timer4, source PBCLK, 1:1 prescaler
 
    // delay 100us per loop until less than 100us remain
    while( t >= 100){
        t-=100;
        TMR4=0;
        while(TMR4 < SYSCLK/10000L);
    }
 
    // delay 10us per loop until less than 10us remain
    while( t >= 10){
        t-=10;
        TMR4=0;
        while(TMR4 < SYSCLK/100000L);
    }
 
    // delay 1us per loop until finished
    while( t > 0)
    {
        t--;
        TMR4=0;
        while(TMR4 < SYSCLK/1000000L);
    }
    // turn off Timer4 so function is self-contained
    T4CONCLR=0x8000;
}

void UART2Configure(int baud_rate)
{
    // Peripheral Pin Select
    U2RXRbits.U2RXR = 4;    //SET RX to RB8
    RPB9Rbits.RPB9R = 2;    //SET RB9 to TX

    U2MODE = 0;         // disable autobaud, TX and RX enabled only, 8N1, idle=HIGH
    U2STA = 0x1400;     // enable TX and RX
    U2BRG = Baud2BRG(baud_rate); // U2BRG = (FPb / (16*baud)) - 1
    
    U2MODESET = 0x8000;     // enable UART2
}

// Needed to by scanf() and gets()
int _mon_getc(int canblock)
{
	char c;
	
    if (canblock)
    {
	    while( !U2STAbits.URXDA); // wait (block) until data available in RX buffer
	    c=U2RXREG;
        while( U2STAbits.UTXBF);    // wait while TX buffer full
        U2TXREG = c;          // echo
	    if(c=='\r') c='\n'; // When using PUTTY, pressing <Enter> sends '\r'.  Ctrl-J sends '\n'
		return (int)c;
    }
    else
    {
        if (U2STAbits.URXDA) // if data available in RX buffer
        {
		    c=U2RXREG;
		    if(c=='\r') c='\n';
			return (int)c;
        }
        else
        {
            return -1; // no characters to return
        }
    }
}

/////////////////////////////////////////////////////////
// UART1 functions used to communicate with the JDY40  //
/////////////////////////////////////////////////////////

// TXD1 is in pin 26
// RXD1 is in pin 24

int UART1Configure(int desired_baud)
{
	int actual_baud;

    // Peripheral Pin Select for UART1.  These are the pins that can be used for U1RX from TABLE 11-1 of '60001168J.pdf':
    // 0000 = RPA2
	// 0001 = RPB6
	// 0010 = RPA4
	// 0011 = RPB13
	// 0100 = RPB2

	// Do what the caption of FIGURE 11-2 in '60001168J.pdf' says: "For input only, PPS functionality does not have
    // priority over TRISx settings. Therefore, when configuring RPn pin for input, the corresponding bit in the
    // TRISx register must also be configured for input (set to ï¿½1ï¿½)."
    
    ANSELB &= ~(1<<13); // Set RB13 as a digital I/O
    TRISB |= (1<<13);   // configure pin RB13 as input
    CNPUB |= (1<<13);   // Enable pull-up resistor for RB13
    U1RXRbits.U1RXR = 3; // SET U1RX to RB13

    // These are the pins that can be used for U1TX. Check table TABLE 11-2 of '60001168J.pdf':
    // RPA0
	// RPB3
	// RPB4
	// RPB15
	// RPB7

    ANSELB &= ~(1<<15); // Set RB15 as a digital I/O
    RPB15Rbits.RPB15R = 1; // SET RB15 to U1TX
	
    U1MODE = 0;         // disable autobaud, TX and RX enabled only, 8N1, idle=HIGH
    U1STA = 0x1400;     // enable TX and RX
    U1BRG = Baud1BRG(desired_baud); // U1BRG = (FPb / (16*baud)) - 1
    // Calculate actual baud rate
    actual_baud = SYSCLK / (16 * (U1BRG+1));

    U1MODESET = 0x8000;     // enable UART1

    return actual_baud;
}

int SerialTransmit1(const char *buffer)
{
    unsigned int size = strlen(buffer);
    while(size)
    {
        while( U1STAbits.UTXBF);    // wait while TX buffer full
        U1TXREG = *buffer;          // send single character to transmit buffer
        buffer++;                   // transmit next character on following loop
        size--;                     // loop until all characters sent (when size = 0)
    }
 
    while( !U1STAbits.TRMT);        // wait for last transmission to finish
 
    return 0;
}

unsigned int SerialReceive1(char *buffer, unsigned int max_size)
{
    unsigned int num_char = 0;
 
    while(num_char < max_size)
    {
        while( !U1STAbits.URXDA);   // wait until data available in RX buffer
        *buffer = U1RXREG;          // empty contents of RX buffer into *buffer pointer
 
        // insert nul character to indicate end of string
        if( *buffer == '\n')
        {
            *buffer = '\0';     
            break;
        }
 
        buffer++;
        num_char++;
    }
 
    return num_char;
}

// Use the core timer to wait for 1 ms.
void wait_1ms(void)
{
    unsigned int ui;
    _CP0_SET_COUNT(0); // resets the core timer count

    // get the core timer count
    while ( _CP0_GET_COUNT() < (SYSCLK/(2*1000)) );
}

void waitms(int len)
{
	while(len--) wait_1ms();
}

#define PIN_PERIOD (PORTB&(1<<5))

// GetPeriod() seems to work fine for frequencies between 200Hz and 700kHz.
long int GetPeriod (int n)
{
	int i;
	unsigned int saved_TCNT1a, saved_TCNT1b;
	//disable interrupts just before measuring period
	__builtin_disable_interrupts();

    _CP0_SET_COUNT(0); // resets the core timer count
	while (PIN_PERIOD!=0) // Wait for square wave to be 0
	{
		if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
	}

    _CP0_SET_COUNT(0); // resets the core timer count
	while (PIN_PERIOD==0) // Wait for square wave to be 1
	{
		if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
	}
	
    _CP0_SET_COUNT(0); // resets the core timer count
	for(i=0; i<n; i++) // Measure the time of 'n' periods
	{
		while (PIN_PERIOD!=0) // Wait for square wave to be 0
		{
			if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
		}
		while (PIN_PERIOD==0) // Wait for square wave to be 1
		{
			if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
		}
	}

	//reenable interrupts just before returning
	__builtin_enable_interrupts();

	return  _CP0_GET_COUNT();
}
 
void uart_puts(char * s)
{
	while(*s)
	{
		putchar(*s);
		s++;
	}
}

char HexDigit[]="0123456789ABCDEF";
void PrintNumber(long int val, int Base, int digits)
{ 
	int j;
	#define NBITS 32
	char buff[NBITS+1];
	buff[NBITS]=0;

	j=NBITS-1;
	while ( (val>0) | (digits>0) )
	{
		buff[j--]=HexDigit[val%Base];
		val/=Base;
		if(digits!=0) digits--;
	}
	uart_puts(&buff[j+1]);
}

// Good information about ADC in PIC32 found here:
// http://umassamherstm5.org/tech-tutorials/pic32-tutorials/pic32mx220-tutorials/adc
void ADCConf(void)
{
    AD1CON1CLR = 0x8000;    // disable ADC before configuration
    AD1CON1 = 0x00E0;       // internal counter ends sampling and starts conversion (auto-convert), manual sample
    AD1CON2 = 0;            // AD1CON2<15:13> set voltage reference to pins AVSS/AVDD
    AD1CON3 = 0x0f01;       // TAD = 4*TPB, acquisition time = 15*TAD 
    AD1CON1SET=0x8000;      // Enable ADC
}

int ADCRead(char analogPIN)
{
    AD1CHS = analogPIN << 16;    // AD1CHS<16:19> controls which analog pin goes to the ADC
 
    AD1CON1bits.SAMP = 1;        // Begin sampling
    while(AD1CON1bits.SAMP);     // wait until acquisition is done
    while(!AD1CON1bits.DONE);    // wait until conversion done
 
    return ADC1BUF0;             // result stored in ADC1BUF0
}

void ConfigurePins(void)
{
    
    // Configure output pins
	TRISAbits.TRISA0 = 0; // pin  2 of DIP28
	TRISAbits.TRISA1 = 0; // pin  3 of DIP28
	TRISBbits.TRISB0 = 0; // pin  4 of DIP28
	TRISAbits.TRISA2 = 0; // pin  9 of DIP28
	INTCONbits.MVEC = 1;
}

void PrintFixedPoint (unsigned long number, int decimals)
{
	int divider=1, j;
	
	j=decimals;
	while(j--) divider*=10;
	
	PrintNumber(number/divider, 10, 1);
	uart_puts(".");
	PrintNumber(number%divider, 10, decimals);
}

void delayms(int len)
{
	while(len--) wait_1ms();
}

// void tostring(char str[], int num)
// {
//     int i, rem, len = 0, n;
 
//     n = num;
//     while (n != 0)
//     {
//         len++;
//         n /= 10;
//     }
//     for (i = 0; i < len; i++)
//     {
//         rem = num % 10;
//         num = num / 10;
//         str[len - (i + 1)] = rem + '0';
//     }
//     str[len] = '\r';
// 	str[len+1] = '\n';
// 	str[len+2] = '\0';
// }

// int gety (char space, char arr[]) {
// 	int i = 0;

// 	while(arr[i] != ' ') {
// 		i++;
// 	}
// 	return i;
// }

void SendATCommand (char * s)
{
	char buff[40];
	printf("Command: %s", s);
	LATB &= ~(1<<14); // 'SET' pin of JDY40 to 0 is 'AT' mode.
	delayms(10);
	SerialTransmit1(s);
	SerialReceive1(buff, sizeof(buff)-1);
	LATB |= 1<<14; // 'SET' pin of JDY40 to 1 is normal operation mode.
	delayms(10);
	printf("Response: %s\n", buff);
}

int LevelSender(int freq, int init_freq)
{
	int speaker_freq, difference; //assume test_freq is the freq got robot, speaker_freq default at 3000
	
	int default_metal_freq = init_freq;
	//for checking
	//difference = 600;

		difference = abs(freq - default_metal_freq);

		//check how much the metal freq increased
		if((difference>=200) && (difference<300)){ // speaker plays 3000 freq
			
			speaker_freq = 1; //level 1

		}
		else if((difference>=300) && (difference<400) ){
			speaker_freq = 2; //level 2

		}
		else if(difference > 400) {
			speaker_freq = 3; //level 3

		}
		// else if((difference>=550) && (difference<700) ){
		// 	speaker_freq = 4; //level 4
		// }
		// else if((difference>=700) && (difference<850) ){
		// 	speaker_freq = 5; //level 5
		// }
		// else if(difference>=850){
		// 	speaker_freq = 6; //level 6

		// }
		else{
			// do nothing
			speaker_freq = 0; //level 0
		}
		return speaker_freq;
		
	}
	
	

// In order to keep this as nimble as possible, avoid
// using floating point or printf() on any of its forms!
void main(void)
{
	volatile unsigned long t=0;
    int adcval;
    long int v;
	int pwm_arr[2];
	char buff[20];
	//char buff_xy[20];
	int cnt = 0;
	unsigned long int count, f, init_freq;
	unsigned char LED_toggle=0;
	//int y_index;
	int timeout_cnt=0;
	char holder[5];
	int x = 238;
	int y = 242;
	unsigned long int speaker_freq;
    
	//int i = 0;
	
	DDPCON = 0;
	CFGCON = 0;
	
    UART2Configure(115200);  // Configure UART2 for a baud rate of 115200
    UART1Configure(9600);
	ConfigurePins();
    SetupTimer1();
  
    ADCConf(); // Configure ADC

	delayms(500); // Give PuTTY time to start

	// RB14 is connected to the 'SET' pin of the JDY40.  Configure as output:
    ANSELB &= ~(1<<14); // Set RB14 as a digital I/O
    TRISB &= ~(1<<14);  // configure pin RB14 as output
	LATB |= (1<<14);    // 'SET' pin of JDY40 to 1 is normal operation mode

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

	ANSELB &= ~(1<<6); // Set RB6 as a digital I/O
    TRISB |= (1<<6);   // configure pin RB6 as input
    CNPUB |= (1<<6);   // Enable pull-up resistor for RB6
	cnt=0;
	pwm_arr[0] = 0;
	pwm_arr[1] = 0;

	count=GetPeriod(100);
				

    if(count>0)
        {
        	init_freq=((SYSCLK/2L)*100L)/count;
            //printf("f = %d\r\n",f); //just for testing
        }
    else
    {	
        uart_puts("NO SIGNAL                     \r");
    }


	while(1)
	{
		//toggle pin
		//LATAbits.LATA3 = 1;
		

		//radio code
		if(U1STAbits.URXDA) // Something has arrived
		{
			SerialReceive1(buff, sizeof(buff)-1);
			// reply after recieving the attention code
			if(buff[0]!='M'){ //if M is not the attention message, then dont do anything :,)
				uart_puts("NO M RECEIVED                     \r");
			}
			
			else{
			uart_puts("M RECEIVED                     \r");

			//timeout sequence so robot doesn't wait forever
			timeout_cnt=0;
			while(1) {
				if(U1STAbits.URXDA) {		//if we've recieved a value, break				
					break;
				}
				Timer4us(100); //wait 100 us
				timeout_cnt++;
				if(timeout_cnt>=100) break;  //if we recieve nothing in 10 ms then break
			}
			
			//continue as normal, and recieve the rest of the message
			if(U1STAbits.URXDA) {
				SerialReceive1(buff,sizeof(buff)-1);
				//printf("string = %s\r\n",buff); //for testing, remember to remove

				if(strlen(buff)==9){ //assume a good message from the transmitter is 9 bytes
					x = atoi(&buff[1]);
					y = atoi(&buff[5]);
					//printf("x = %d, y = %d\r\n",x,y); //for testing, remember to remove
					//calculate PWM values

				}
				
				//calculate frequency value 
				
				count=GetPeriod(100);
				

                if(count>0)
                {
                    f=((SYSCLK/2L)*100L)/count;
                    //printf("f = %d\r\n",f); //just for testing
					speaker_freq = LevelSender(f,init_freq);
					
                }
                else
                {
                    uart_puts("NO SIGNAL                     \r");
                }
				//thefastestsprintf(speaker_freq,buff); 
				holder[0] = speaker_freq + '0';
				holder[1] = '\r';
				holder[2] = '\n';
				holder[3] = '\0';
				printf("i_freq = %d, freq=%d, level=%s\r\n",init_freq,f,holder); //for testing
				//constantly send the frequency value until the remote receives the correct value
				
				SerialTransmit1(holder);
				}
			}
		}
		pwmcalc(x,y,pwm_arr);
		ISR_pwm1 = pwm_arr[0]*1.2;
		ISR_pwm2 = pwm_arr[1]*1.2;
		//printf("pwm1=%d, pwm2=%d\r\n",ISR_pwm1,ISR_pwm2);
		//LATAbits.LATA3 = 0;
	}
}