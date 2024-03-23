;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
<<<<<<< HEAD
; This file was generated Fri Mar 22 17:16:22 2024
=======
; This file was generated Fri Mar 22 16:24:49 2024
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;--------------------------------------------------------
$name EFM8_JDY40_test
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _SendATCommand
	public _waitms_or_RI1
	public _RXU1
	public _getstr1
	public _getchar1_with_timeout
	public _getchar1
	public _sendstr1
	public _putchar1
	public _UART1_Init
	public _Volts_at_Pin
	public _Get_ADC
	public _ADC_at_Pin
	public _InitPinADC
	public _waitms
	public _Timer2_ISR
	public _TIMER2_Init
	public _TIMER0_Init
	public _Timer3us
	public _InitADC
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _buff
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_main_volt_x_1_123:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
_buff:
	ds 20
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:35: char _c51_external_startup (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:31: char _c51_external_startup (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
<<<<<<< HEAD
;	EFM8_JDY40_test.c:38: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:39: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	EFM8_JDY40_test.c:40: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	EFM8_JDY40_test.c:42: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	EFM8_JDY40_test.c:43: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	EFM8_JDY40_test.c:50: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	EFM8_JDY40_test.c:51: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	EFM8_JDY40_test.c:52: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:73: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	EFM8_JDY40_test.c:74: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	EFM8_JDY40_test.c:75: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	EFM8_JDY40_test.c:76: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	EFM8_JDY40_test.c:77: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	EFM8_JDY40_test.c:78: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	EFM8_JDY40_test.c:83: P0MDOUT |= 0x11; // Enable UART0 TX (P0.4) and UART1 TX (P0.0) as push-pull outputs
	orl	_P0MDOUT,#0x11
;	EFM8_JDY40_test.c:84: P2MDOUT |= 0x01; // P2.0 in push-pull mode
	orl	_P2MDOUT,#0x01
;	EFM8_JDY40_test.c:85: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	EFM8_JDY40_test.c:86: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	EFM8_JDY40_test.c:87: XBR2     = 0x41; // Enable crossbar and uart 1
	mov	_XBR2,#0x41
;	EFM8_JDY40_test.c:93: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	EFM8_JDY40_test.c:94: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	EFM8_JDY40_test.c:95: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	EFM8_JDY40_test.c:96: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	EFM8_JDY40_test.c:97: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	EFM8_JDY40_test.c:98: TR1 = 1; // START Timer1
	setb	_TR1
;	EFM8_JDY40_test.c:99: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	EFM8_JDY40_test.c:101: return 0;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:34: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:35: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:36: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:38: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:39: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:46: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:47: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:48: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:69: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:70: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:71: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:72: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:73: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:74: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:79: P0MDOUT |= 0x11; // Enable UART0 TX (P0.4) and UART1 TX (P0.0) as push-pull outputs
	orl	_P0MDOUT,#0x11
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:80: P2MDOUT |= 0x01; // P2.0 in push-pull mode
	orl	_P2MDOUT,#0x01
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:81: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:82: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:83: XBR2     = 0x41; // Enable crossbar and uart 1
	mov	_XBR2,#0x41
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:89: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:90: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:91: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:92: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:93: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:94: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:95: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:97: return 0;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:104: void InitADC (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:100: void InitADC (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:106: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:107: ADEN=0; // Disable ADC
	clr	_ADEN
;	EFM8_JDY40_test.c:112: (0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	mov	_ADC0CN1,#0x80
;	EFM8_JDY40_test.c:116: (0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	mov	_ADC0CF0,#0x20
;	EFM8_JDY40_test.c:120: (0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	mov	_ADC0CF1,#0x1E
;	EFM8_JDY40_test.c:129: (0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.
	mov	_ADC0CN0,#0x00
;	EFM8_JDY40_test.c:134: (0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	mov	_ADC0CF2,#0x3F
;	EFM8_JDY40_test.c:138: (0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3
	mov	_ADC0CN2,#0x00
;	EFM8_JDY40_test.c:140: ADEN=1; // Enable ADC
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:102: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:103: ADEN=0; // Disable ADC
	clr	_ADEN
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:108: (0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	mov	_ADC0CN1,#0x80
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:112: (0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	mov	_ADC0CF0,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:116: (0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	mov	_ADC0CF1,#0x1E
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:125: (0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.
	mov	_ADC0CN0,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:130: (0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	mov	_ADC0CF2,#0x3F
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:134: (0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3
	mov	_ADC0CN2,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:136: ADEN=1; // Enable ADC
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:145: void Timer3us(unsigned char us)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:141: void Timer3us(unsigned char us)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:150: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	EFM8_JDY40_test.c:152: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	EFM8_JDY40_test.c:153: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	EFM8_JDY40_test.c:155: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	EFM8_JDY40_test.c:156: for (i = 0; i < us; i++)       // Count <us> overflows
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:146: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:148: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:149: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:151: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:152: for (i = 0; i < us; i++)       // Count <us> overflows
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
<<<<<<< HEAD
;	EFM8_JDY40_test.c:158: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	EFM8_JDY40_test.c:159: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	EFM8_JDY40_test.c:156: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	EFM8_JDY40_test.c:161: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:154: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:155: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:152: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:157: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:164: void TIMER0_Init(void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:160: void TIMER0_Init(void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:166: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	EFM8_JDY40_test.c:167: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	EFM8_JDY40_test.c:168: TR0=0; // Stop Timer/Counter 0
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:162: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:163: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:164: TR0=0; // Stop Timer/Counter 0
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER2_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:174: void TIMER2_Init(void){
;	-----------------------------------------
;	 function TIMER2_Init
;	-----------------------------------------
_TIMER2_Init:
;	EFM8_JDY40_test.c:176: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	EFM8_JDY40_test.c:177: CKCON0|=0b_0001_0000;
	orl	_CKCON0,#0x10
;	EFM8_JDY40_test.c:178: TMR2RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
	mov	_TMR2RL,#0xEE
	mov	(_TMR2RL >> 8),#0xF6
;	EFM8_JDY40_test.c:179: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	EFM8_JDY40_test.c:180: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	EFM8_JDY40_test.c:181: TR2=1;         // Start Timer2
	setb	_TR2
;	EFM8_JDY40_test.c:182: EA=1; // Global interrupt enable
	setb	_EA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:185: void Timer2_ISR (void) //interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
;	EFM8_JDY40_test.c:187: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	EFM8_JDY40_test.c:188: OUT0=!OUT0;
	cpl	_P3_3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:192: void waitms (unsigned int ms)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:167: void waitms (unsigned int ms)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
<<<<<<< HEAD
;	EFM8_JDY40_test.c:196: for(j=0; j<ms; j++)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:171: for(j=0; j<ms; j++)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	r4,#0x00
	mov	r5,#0x00
L008005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
<<<<<<< HEAD
	jnc	L008009?
;	EFM8_JDY40_test.c:197: for (k=0; k<4; k++) Timer3us(250);
=======
	jnc	L006009?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:172: for (k=0; k<4; k++) Timer3us(250);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	r6,#0x00
L008001?:
	cjne	r6,#0x04,L008018?
L008018?:
	jnc	L008007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
<<<<<<< HEAD
	sjmp	L008001?
L008007?:
;	EFM8_JDY40_test.c:196: for(j=0; j<ms; j++)
=======
	sjmp	L006001?
L006007?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:171: for(j=0; j<ms; j++)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	inc	r4
	cjne	r4,#0x00,L008005?
	inc	r5
	sjmp	L008005?
L008009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:200: void InitPinADC (unsigned char portno, unsigned char pinno)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:175: void InitPinADC (unsigned char portno, unsigned char pinno)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:204: mask=1<<pinno;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:179: mask=1<<pinno;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L009013?
L009011?:
	add	a,acc
L009013?:
	djnz	b,L009011?
	mov	r3,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:206: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:207: switch (portno)
	cjne	r2,#0x00,L009014?
	sjmp	L009001?
L009014?:
	cjne	r2,#0x01,L009015?
	sjmp	L009002?
L009015?:
;	EFM8_JDY40_test.c:209: case 0:
	cjne	r2,#0x02,L009005?
	sjmp	L009003?
L009001?:
;	EFM8_JDY40_test.c:210: P0MDIN &= (~mask); // Set pin as analog input
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:181: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:182: switch (portno)
	cjne	r2,#0x00,L007014?
	sjmp	L007001?
L007014?:
	cjne	r2,#0x01,L007015?
	sjmp	L007002?
L007015?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:184: case 0:
	cjne	r2,#0x02,L007005?
	sjmp	L007003?
L007001?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:185: P0MDIN &= (~mask); // Set pin as analog input
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:211: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	EFM8_JDY40_test.c:212: break;
;	EFM8_JDY40_test.c:213: case 1:
	sjmp	L009005?
L009002?:
;	EFM8_JDY40_test.c:214: P1MDIN &= (~mask); // Set pin as analog input
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:186: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:187: break;
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:188: case 1:
	sjmp	L007005?
L007002?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:189: P1MDIN &= (~mask); // Set pin as analog input
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:215: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	EFM8_JDY40_test.c:216: break;
;	EFM8_JDY40_test.c:217: case 2:
	sjmp	L009005?
L009003?:
;	EFM8_JDY40_test.c:218: P2MDIN &= (~mask); // Set pin as analog input
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:190: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:191: break;
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:192: case 2:
	sjmp	L007005?
L007003?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:193: P2MDIN &= (~mask); // Set pin as analog input
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:219: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	EFM8_JDY40_test.c:223: }
L009005?:
;	EFM8_JDY40_test.c:224: SFRPAGE = 0x00;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:194: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:198: }
L007005?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:199: SFRPAGE = 0x00;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:227: unsigned int ADC_at_Pin(unsigned char pin)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:202: unsigned int ADC_at_Pin(unsigned char pin)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:230: ADINT = 0;
	clr	_ADINT
;	EFM8_JDY40_test.c:231: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	EFM8_JDY40_test.c:232: while (!ADINT); // Wait for conversion to complete
L010001?:
	jnb	_ADINT,L010001?
;	EFM8_JDY40_test.c:233: return (ADC0);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:205: ADINT = 0;
	clr	_ADINT
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:206: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:207: while (!ADINT); // Wait for conversion to complete
L008001?:
	jnb	_ADINT,L008001?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:208: return (ADC0);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_ADC'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:236: unsigned int Get_ADC (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:211: unsigned int Get_ADC (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function Get_ADC
;	-----------------------------------------
_Get_ADC:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:238: ADINT = 0;
	clr	_ADINT
;	EFM8_JDY40_test.c:239: ADBUSY = 1;
	setb	_ADBUSY
;	EFM8_JDY40_test.c:240: while (!ADINT); // Wait for conversion to complete
L011001?:
	jnb	_ADINT,L011001?
;	EFM8_JDY40_test.c:241: return (ADC0);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:213: ADINT = 0;
	clr	_ADINT
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:214: ADBUSY = 1;
	setb	_ADBUSY
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:215: while (!ADINT); // Wait for conversion to complete
L009001?:
	jnb	_ADINT,L009001?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:216: return (ADC0);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:245: float Volts_at_Pin(unsigned char pin)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:220: float Volts_at_Pin(unsigned char pin)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:247: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:222: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x9B
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:250: void UART1_Init (unsigned long baudrate)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:225: void UART1_Init (unsigned long baudrate)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:252: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:253: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	EFM8_JDY40_test.c:254: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	EFM8_JDY40_test.c:255: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	EFM8_JDY40_test.c:256: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:227: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:228: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:229: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:230: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:231: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	__divulong_PARM_2,r2
	mov	(__divulong_PARM_2 + 1),r3
	mov	(__divulong_PARM_2 + 2),r4
	mov	(__divulong_PARM_2 + 3),r5
	mov	dptr,#0xA200
	mov	b,#0x4A
	mov	a,#0x04
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__divulong_PARM_2,#0x18
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	clr	a
	subb	a,r5
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
<<<<<<< HEAD
;	EFM8_JDY40_test.c:257: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	EFM8_JDY40_test.c:258: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	EFM8_JDY40_test.c:259: SFRPAGE = 0x00;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:232: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:233: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:234: SFRPAGE = 0x00;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar1'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:262: void putchar1 (char c) 
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:237: void putchar1 (char c) 
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function putchar1
;	-----------------------------------------
_putchar1:
	mov	r2,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:264: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:265: while (!TI1);
L014001?:
;	EFM8_JDY40_test.c:266: TI1=0;
	jbc	_TI1,L014008?
	sjmp	L014001?
L014008?:
;	EFM8_JDY40_test.c:267: SBUF1 = c;
	mov	_SBUF1,r2
;	EFM8_JDY40_test.c:268: SFRPAGE = 0x00;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:239: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:240: while (!TI1);
L012001?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:241: TI1=0;
	jbc	_TI1,L012008?
	sjmp	L012001?
L012008?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:242: SBUF1 = c;
	mov	_SBUF1,r2
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:243: SFRPAGE = 0x00;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendstr1'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:271: void sendstr1 (char * s)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:246: void sendstr1 (char * s)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function sendstr1
;	-----------------------------------------
_sendstr1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
<<<<<<< HEAD
;	EFM8_JDY40_test.c:273: while(*s)
L015001?:
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:248: while(*s)
L013001?:
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
<<<<<<< HEAD
	jz	L015004?
;	EFM8_JDY40_test.c:275: putchar1(*s);
=======
	jz	L013004?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:250: putchar1(*s);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_putchar1
	pop	ar4
	pop	ar3
	pop	ar2
<<<<<<< HEAD
;	EFM8_JDY40_test.c:276: s++;	
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:251: s++;	
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	inc	r2
	cjne	r2,#0x00,L015001?
	inc	r3
	sjmp	L015001?
L015004?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:280: char getchar1 (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:255: char getchar1 (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:283: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:284: while (!RI1);
L016001?:
;	EFM8_JDY40_test.c:285: RI1=0;
	jbc	_RI1,L016008?
	sjmp	L016001?
L016008?:
;	EFM8_JDY40_test.c:287: SCON1&=0b_0011_1111;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:258: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:259: while (!RI1);
L014001?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:260: RI1=0;
	jbc	_RI1,L014008?
	sjmp	L014001?
L014008?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:262: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:263: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:264: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:265: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1_with_timeout'
;------------------------------------------------------------
;c                         Allocated to registers 
;timeout                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:268: char getchar1_with_timeout (void)
;	-----------------------------------------
;	 function getchar1_with_timeout
;	-----------------------------------------
_getchar1_with_timeout:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:272: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:274: while (!RI1)
	mov	r2,#0x00
	mov	r3,#0x00
L015003?:
	jb	_RI1,L015005?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:276: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:277: Timer3us(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:278: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:279: timeout++;
	inc	r2
	cjne	r2,#0x00,L015012?
	inc	r3
L015012?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:280: if(timeout==25000)
	cjne	r2,#0xA8,L015003?
	cjne	r3,#0x61,L015003?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:282: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:283: return ('\n'); // Timeout after half second
	mov	dpl,#0x0A
	ret
L015005?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:286: RI1=0;
	clr	_RI1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:288: SCON1&=0b_0011_1111;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	anl	_SCON1,#0x3F
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:289: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:290: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:291: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1_with_timeout'
;------------------------------------------------------------
;c                         Allocated to registers 
;timeout                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:293: char getchar1_with_timeout (void)
;	-----------------------------------------
;	 function getchar1_with_timeout
;	-----------------------------------------
_getchar1_with_timeout:
;	EFM8_JDY40_test.c:297: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:299: while (!RI1)
	mov	r2,#0x00
	mov	r3,#0x00
L017003?:
	jb	_RI1,L017005?
;	EFM8_JDY40_test.c:301: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:302: Timer3us(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:303: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:304: timeout++;
	inc	r2
	cjne	r2,#0x00,L017012?
	inc	r3
L017012?:
;	EFM8_JDY40_test.c:305: if(timeout==25000)
	cjne	r2,#0xA8,L017003?
	cjne	r3,#0x61,L017003?
;	EFM8_JDY40_test.c:307: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:308: return ('\n'); // Timeout after half second
	mov	dpl,#0x0A
	ret
L017005?:
;	EFM8_JDY40_test.c:311: RI1=0;
	clr	_RI1
;	EFM8_JDY40_test.c:313: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	EFM8_JDY40_test.c:314: c = SBUF1;
	mov	dpl,_SBUF1
;	EFM8_JDY40_test.c:315: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:316: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getstr1'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;c                         Allocated to registers r5 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:319: void getstr1 (char * s)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:294: void getstr1 (char * s)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function getstr1
;	-----------------------------------------
_getstr1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
<<<<<<< HEAD
;	EFM8_JDY40_test.c:323: while(1)
L018004?:
;	EFM8_JDY40_test.c:325: c=getchar1_with_timeout();
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:298: while(1)
L016004?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:300: c=getchar1_with_timeout();
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	push	ar2
	push	ar3
	push	ar4
	lcall	_getchar1_with_timeout
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
<<<<<<< HEAD
;	EFM8_JDY40_test.c:326: if(c=='\n')
	cjne	r5,#0x0A,L018002?
;	EFM8_JDY40_test.c:328: *s=0;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:301: if(c=='\n')
	cjne	r5,#0x0A,L016002?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:303: *s=0;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:329: return;
	ljmp	__gptrput
L018002?:
;	EFM8_JDY40_test.c:331: *s=c;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:304: return;
	ljmp	__gptrput
L016002?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:306: *s=c;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
<<<<<<< HEAD
;	EFM8_JDY40_test.c:332: s++;
	sjmp	L018004?
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:307: s++;
	sjmp	L016004?
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;------------------------------------------------------------
;Allocation info for local variables in function 'RXU1'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:337: bit RXU1 (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:312: bit RXU1 (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function RXU1
;	-----------------------------------------
_RXU1:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:340: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:341: mybit=RI1;
	mov	c,_RI1
;	EFM8_JDY40_test.c:342: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:343: return mybit;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:315: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:316: mybit=RI1;
	mov	c,_RI1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:317: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:318: return mybit;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms_or_RI1'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:346: void waitms_or_RI1 (unsigned int ms)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:321: void waitms_or_RI1 (unsigned int ms)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function waitms_or_RI1
;	-----------------------------------------
_waitms_or_RI1:
	mov	r2,dpl
	mov	r3,dph
<<<<<<< HEAD
;	EFM8_JDY40_test.c:350: for(j=0; j<ms; j++)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:325: for(j=0; j<ms; j++)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	r4,#0x00
	mov	r5,#0x00
L020007?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
<<<<<<< HEAD
	jnc	L020011?
;	EFM8_JDY40_test.c:352: for (k=0; k<4; k++)
	mov	r6,#0x00
L020003?:
	cjne	r6,#0x04,L020019?
L020019?:
	jnc	L020009?
;	EFM8_JDY40_test.c:354: if(RXU1()) return;
=======
	jnc	L018011?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:327: for (k=0; k<4; k++)
	mov	r6,#0x00
L018003?:
	cjne	r6,#0x04,L018019?
L018019?:
	jnc	L018009?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:329: if(RXU1()) return;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_RXU1
	clr	a
	rlc	a
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jz	L020002?
	ret
<<<<<<< HEAD
L020002?:
;	EFM8_JDY40_test.c:355: Timer3us(250);
=======
L018002?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:330: Timer3us(250);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
<<<<<<< HEAD
;	EFM8_JDY40_test.c:352: for (k=0; k<4; k++)
	inc	r6
	sjmp	L020003?
L020009?:
;	EFM8_JDY40_test.c:350: for(j=0; j<ms; j++)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:327: for (k=0; k<4; k++)
	inc	r6
	sjmp	L018003?
L018009?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:325: for(j=0; j<ms; j++)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	inc	r4
	cjne	r4,#0x00,L020007?
	inc	r5
	sjmp	L020007?
L020011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SendATCommand'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:360: void SendATCommand (char * s)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:335: void SendATCommand (char * s)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function SendATCommand
;	-----------------------------------------
_SendATCommand:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
<<<<<<< HEAD
;	EFM8_JDY40_test.c:362: printf("Command: %s", s);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:337: printf("Command: %s", s);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	push	ar2
	push	ar3
	push	ar4
	push	ar2
	push	ar3
	push	ar4
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:363: P3_0=0; // 'set' pin to 0 is 'AT' mode.
	clr	_P3_0
;	EFM8_JDY40_test.c:364: waitms(5);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:338: P3_0=0; // 'set' pin to 0 is 'AT' mode.
	clr	_P3_0
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:339: waitms(5);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
<<<<<<< HEAD
;	EFM8_JDY40_test.c:365: sendstr1(s);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:340: sendstr1(s);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_sendstr1
<<<<<<< HEAD
;	EFM8_JDY40_test.c:366: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_getstr1
;	EFM8_JDY40_test.c:367: waitms(10);
	mov	dptr,#0x000A
	lcall	_waitms
;	EFM8_JDY40_test.c:368: P3_0=1; // 'set' pin to 1 is normal operation mode.
	setb	_P3_0
;	EFM8_JDY40_test.c:369: printf("Response: %s\r\n", buff);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:341: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_getstr1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:342: waitms(10);
	mov	dptr,#0x000A
	lcall	_waitms
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:343: P3_0=1; // 'set' pin to 1 is normal operation mode.
	setb	_P3_0
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:344: printf("Response: %s\r\n", buff);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:374: void LCD_pulse (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:349: void LCD_pulse (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:376: LCD_E=1;
	setb	_P2_0
;	EFM8_JDY40_test.c:377: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	EFM8_JDY40_test.c:378: LCD_E=0;
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:351: LCD_E=1;
	setb	_P2_0
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:352: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:353: LCD_E=0;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	clr	_P2_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:381: void LCD_byte (unsigned char x)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:356: void LCD_byte (unsigned char x)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:384: ACC=x; //Send high nible
	mov	_ACC,r2
;	EFM8_JDY40_test.c:385: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	EFM8_JDY40_test.c:386: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	EFM8_JDY40_test.c:387: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	EFM8_JDY40_test.c:388: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	EFM8_JDY40_test.c:389: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	EFM8_JDY40_test.c:390: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	EFM8_JDY40_test.c:391: ACC=x; //Send low nible
	mov	_ACC,r2
;	EFM8_JDY40_test.c:392: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	EFM8_JDY40_test.c:393: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	EFM8_JDY40_test.c:394: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	EFM8_JDY40_test.c:395: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	EFM8_JDY40_test.c:396: LCD_pulse();
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:359: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:360: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:361: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:362: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:363: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:364: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:365: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:366: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:367: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:368: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:369: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:370: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:371: LCD_pulse();
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:399: void WriteData (unsigned char x)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:374: void WriteData (unsigned char x)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:401: LCD_RS=1;
	setb	_P1_7
;	EFM8_JDY40_test.c:402: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	EFM8_JDY40_test.c:403: waitms(2);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:376: LCD_RS=1;
	setb	_P1_7
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:377: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:378: waitms(2);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:406: void WriteCommand (unsigned char x)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:381: void WriteCommand (unsigned char x)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
<<<<<<< HEAD
;	EFM8_JDY40_test.c:408: LCD_RS=0;
	clr	_P1_7
;	EFM8_JDY40_test.c:409: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	EFM8_JDY40_test.c:410: waitms(5);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:383: LCD_RS=0;
	clr	_P1_7
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:384: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:385: waitms(5);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:413: void LCD_4BIT (void)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:388: void LCD_4BIT (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:415: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_0
;	EFM8_JDY40_test.c:417: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	EFM8_JDY40_test.c:419: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:420: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:421: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:424: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:425: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:426: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:427: waitms(20); // Wait for clear screen command to finsih.
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:390: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_0
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:392: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:394: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:395: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:396: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:399: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:400: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:401: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:402: waitms(20); // Wait for clear screen command to finsih.
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
<<<<<<< HEAD
;	EFM8_JDY40_test.c:430: void LCDprint(char * string, unsigned char line, bit clear)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:405: void LCDprint(char * string, unsigned char line, bit clear)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
<<<<<<< HEAD
;	EFM8_JDY40_test.c:434: WriteCommand(line==2?0xc0:0x80);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:409: WriteCommand(line==2?0xc0:0x80);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L027013?
	mov	r5,#0xC0
	sjmp	L027014?
L027013?:
	mov	r5,#0x80
L027014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
<<<<<<< HEAD
;	EFM8_JDY40_test.c:435: waitms(5);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:410: waitms(5);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
<<<<<<< HEAD
;	EFM8_JDY40_test.c:436: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:411: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	r5,#0x00
	mov	r6,#0x00
L027003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L027006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L027003?
	inc	r6
<<<<<<< HEAD
	sjmp	L027003?
L027006?:
;	EFM8_JDY40_test.c:437: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L027011?
=======
	sjmp	L025003?
L025006?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:412: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L025011?
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	ar2,r5
	mov	ar3,r6
L027007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L027011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L027007?
	inc	r3
	sjmp	L027007?
L027011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;cnt                       Allocated to registers r2 r3 
<<<<<<< HEAD
;volt_x                    Allocated with name '_main_volt_x_1_123'
;volt_y                    Allocated to registers r4 r5 r6 r7 
;frequency                 Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:440: void main (void)
=======
;volt_x                    Allocated to registers 
;volt_y                    Allocated to registers 
;frequency                 Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:415: void main (void)
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
<<<<<<< HEAD
;	EFM8_JDY40_test.c:449: InitADC();
	lcall	_InitADC
;	EFM8_JDY40_test.c:450: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	EFM8_JDY40_test.c:451: printf("\r\nJDY-40 test\r\n");
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:424: InitADC();
	lcall	_InitADC
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:425: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:426: printf("\r\nJDY-40 test\r\n");
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
<<<<<<< HEAD
;	EFM8_JDY40_test.c:452: UART1_Init(9600);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:427: UART1_Init(9600);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x2580
	clr	a
	mov	b,a
	lcall	_UART1_Init
<<<<<<< HEAD
;	EFM8_JDY40_test.c:453: InitPinADC(2,4); //for y remote
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	EFM8_JDY40_test.c:454: InitPinADC(2,5); //for x remote
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x02
	lcall	_InitPinADC
;	EFM8_JDY40_test.c:473: SendATCommand("AT+DVID9944\r\n");  
	mov	dptr,#__str_3
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:476: SendATCommand("AT+VER\r\n");
	mov	dptr,#__str_4
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:477: SendATCommand("AT+BAUD\r\n");
	mov	dptr,#__str_5
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:478: SendATCommand("AT+RFID\r\n");
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:479: SendATCommand("AT+DVID\r\n");
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:480: SendATCommand("AT+RFC\r\n");
	mov	dptr,#__str_8
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:481: SendATCommand("AT+POWE\r\n");
	mov	dptr,#__str_9
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:482: SendATCommand("AT+CLSS\r\n");
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_SendATCommand
;	EFM8_JDY40_test.c:484: printf("\r\nPress and hold the BOOT button to transmit.\r\n");
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:428: InitPinADC(2,4); //for y remote
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:429: InitPinADC(2,5); //for x remote
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:446: SendATCommand("AT+DVID9944\r\n");  
	mov	dptr,#__str_3
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:449: SendATCommand("AT+VER\r\n");
	mov	dptr,#__str_4
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:450: SendATCommand("AT+BAUD\r\n");
	mov	dptr,#__str_5
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:451: SendATCommand("AT+RFID\r\n");
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:452: SendATCommand("AT+DVID\r\n");
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:453: SendATCommand("AT+RFC\r\n");
	mov	dptr,#__str_8
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:454: SendATCommand("AT+POWE\r\n");
	mov	dptr,#__str_9
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:455: SendATCommand("AT+CLSS\r\n");
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:457: printf("\r\nPress and hold the BOOT button to transmit.\r\n");
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
<<<<<<< HEAD
;	EFM8_JDY40_test.c:487: while(1)
	mov	r2,#0x00
	mov	r3,#0x00
L028008?:
;	EFM8_JDY40_test.c:492: volt_x = Volts_at_Pin(QFP32_MUX_P1_4);
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:460: while(1)
	mov	r2,#0x00
	mov	r3,#0x00
L026008?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:465: volt_x = Volts_at_Pin(QFP32_MUX_P1_4);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	lcall	_Volts_at_Pin
<<<<<<< HEAD
	mov	_main_volt_x_1_123,dpl
	mov	(_main_volt_x_1_123 + 1),dph
	mov	(_main_volt_x_1_123 + 2),b
	mov	(_main_volt_x_1_123 + 3),a
;	EFM8_JDY40_test.c:493: volt_y = Volts_at_Pin(QFP32_MUX_P1_5);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	EFM8_JDY40_test.c:500: sprintf(buff, "%f %f\r\n", volt_x, volt_y);
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	_main_volt_x_1_123
	push	(_main_volt_x_1_123 + 1)
	push	(_main_volt_x_1_123 + 2)
	push	(_main_volt_x_1_123 + 3)
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:466: volt_y = Volts_at_Pin(QFP32_MUX_P1_5);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	pop	ar3
	pop	ar2
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:480: if(P3_7==0)
	jb	_P3_7,L026002?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:482: sprintf(buff, "JDY40 test %d\r\n", cnt++);
	mov	ar4,r2
	mov	ar5,r3
	inc	r2
	cjne	r2,#0x00,L026018?
	inc	r3
L026018?:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
<<<<<<< HEAD
	add	a,#0xf2
	mov	sp,a
;	EFM8_JDY40_test.c:501: sendstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_sendstr1
;	EFM8_JDY40_test.c:502: waitms_or_RI1(200);
=======
	add	a,#0xf8
	mov	sp,a
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:483: sendstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_sendstr1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:484: putchar('.');
	mov	dpl,#0x2E
	lcall	_putchar
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:485: waitms_or_RI1(200);
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#0x00C8
	lcall	_waitms_or_RI1
	pop	ar3
	pop	ar2
<<<<<<< HEAD
;	EFM8_JDY40_test.c:507: if(P3_7==0)
	jb	_P3_7,L028002?
;	EFM8_JDY40_test.c:509: sprintf(buff, "JDY40 test %d\r\n", cnt++);
	mov	ar4,r2
	mov	ar5,r3
	inc	r2
	cjne	r2,#0x00,L028018?
	inc	r3
L028018?:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
=======
L026002?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:488: if(RXU1())
	push	ar2
	push	ar3
	lcall	_RXU1
	pop	ar3
	pop	ar2
	jnc	L026008?
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:491: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	push	ar2
	push	ar3
	lcall	_getstr1
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:492: printf("Freq: %s\r\n", buff);
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
;	EFM8_JDY40_test.c:510: sendstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_sendstr1
;	EFM8_JDY40_test.c:511: putchar('.');
	mov	dpl,#0x2E
	lcall	_putchar
;	EFM8_JDY40_test.c:512: waitms_or_RI1(200);
	mov	dptr,#0x00C8
	lcall	_waitms_or_RI1
	pop	ar3
	pop	ar2
L028002?:
;	EFM8_JDY40_test.c:515: if(RXU1())
	push	ar2
	push	ar3
	lcall	_RXU1
	pop	ar3
	pop	ar2
	jc	L028019?
	ljmp	L028008?
L028019?:
;	EFM8_JDY40_test.c:518: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	push	ar2
	push	ar3
	lcall	_getstr1
;	EFM8_JDY40_test.c:519: printf("Freq: %s\r\n", buff);
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_14
	push	acc
	mov	a,#(__str_14 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:520: frequency = atof(buff); // change string -> float 
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:493: frequency = atof(buff); // change string -> float 
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_atof
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
<<<<<<< HEAD
;	EFM8_JDY40_test.c:523: if(frequency >= 2500){ //2500 is just a radom number we pick for now
=======
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:496: if(frequency >= 2500){ //2500 is just a radom number we pick for now
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	clr	a
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#0x1C
	push	acc
	mov	a,#0x45
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
<<<<<<< HEAD
	jz	L028020?
	ljmp	L028008?
L028020?:
;	EFM8_JDY40_test.c:524: return;
=======
	jz	L026020?
	ljmp	L026008?
L026020?:
;	C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\EFM8_JDY40_test.c:497: return;
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Command: %s'
	db 0x00
__str_1:
	db 'Response: %s'
	db 0x0D
	db 0x0A
	db 0x00
__str_2:
	db 0x0D
	db 0x0A
	db 'JDY-40 test'
	db 0x0D
	db 0x0A
	db 0x00
__str_3:
	db 'AT+DVID9944'
	db 0x0D
	db 0x0A
	db 0x00
__str_4:
	db 'AT+VER'
	db 0x0D
	db 0x0A
	db 0x00
__str_5:
	db 'AT+BAUD'
	db 0x0D
	db 0x0A
	db 0x00
__str_6:
	db 'AT+RFID'
	db 0x0D
	db 0x0A
	db 0x00
__str_7:
	db 'AT+DVID'
	db 0x0D
	db 0x0A
	db 0x00
__str_8:
	db 'AT+RFC'
	db 0x0D
	db 0x0A
	db 0x00
__str_9:
	db 'AT+POWE'
	db 0x0D
	db 0x0A
	db 0x00
__str_10:
	db 'AT+CLSS'
	db 0x0D
	db 0x0A
	db 0x00
__str_11:
	db 0x0D
	db 0x0A
	db 'Press and hold the BOOT button to transmit.'
	db 0x0D
	db 0x0A
	db 0x00
__str_12:
<<<<<<< HEAD
	db '%f %f'
=======
	db 'JDY40 test %d'
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	db 0x0D
	db 0x0A
	db 0x00
__str_13:
<<<<<<< HEAD
	db 'JDY40 test %d'
	db 0x0D
	db 0x0A
	db 0x00
__str_14:
=======
>>>>>>> 24db02c123a3c0efc890de0856246d5bdc07e639
	db 'Freq: %s'
	db 0x0D
	db 0x0A
	db 0x00

	CSEG

end
