;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Wed Apr 03 22:19:02 2024
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
	public _LCD_build_right_empty
	public _LCD_build_mid_empty
	public _LCD_build_left_empty
	public _LCD_build_mid
	public _LCD_build_right
	public _LCD_build_left
	public _thefastestsprintf
	public _LCDprint2
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _speaker_pulse
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
	public _TIMER0_Init
	public _Timer3us
	public _InitADC
	public _PCA_ISR
	public _Timer4_ISR
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _buff
	public _thefastestsprintf_PARM_3
	public _thefastestsprintf_PARM_2
	public _LCDprint2_PARM_3
	public _LCDprint2_PARM_2
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
_LCDprint2_PARM_2:
	ds 1
_LCDprint2_PARM_3:
	ds 1
_thefastestsprintf_PARM_2:
	ds 3
_thefastestsprintf_PARM_3:
	ds 2
_thefastestsprintf_num_1_129:
	ds 2
_thefastestsprintf_i_1_130:
	ds 2
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
	CSEG at 0x005b
	ljmp	_PCA_ISR
	CSEG at 0x008b
	ljmp	_Timer4_ISR
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
;	EFM8_JDY40_test.c:42: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	EFM8_JDY40_test.c:45: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:46: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	EFM8_JDY40_test.c:47: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	EFM8_JDY40_test.c:49: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	EFM8_JDY40_test.c:50: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	EFM8_JDY40_test.c:57: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	EFM8_JDY40_test.c:58: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	EFM8_JDY40_test.c:59: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:80: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	EFM8_JDY40_test.c:81: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	EFM8_JDY40_test.c:82: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	EFM8_JDY40_test.c:83: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	EFM8_JDY40_test.c:84: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	EFM8_JDY40_test.c:85: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	EFM8_JDY40_test.c:90: P0MDOUT |= 0x11; // Enable UART0 TX (P0.4) and UART1 TX (P0.0) as push-pull outputs
	orl	_P0MDOUT,#0x11
;	EFM8_JDY40_test.c:91: P2MDOUT |= 0x00; // P2.0 in push-pull mode
	mov	_P2MDOUT,_P2MDOUT
;	EFM8_JDY40_test.c:92: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	EFM8_JDY40_test.c:93: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	EFM8_JDY40_test.c:94: XBR2     = 0x41; // Enable crossbar and uart 1
	mov	_XBR2,#0x41
;	EFM8_JDY40_test.c:111: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	EFM8_JDY40_test.c:112: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	EFM8_JDY40_test.c:113: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	EFM8_JDY40_test.c:114: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	EFM8_JDY40_test.c:115: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	EFM8_JDY40_test.c:116: TR1 = 1; // START Timer1
	setb	_TR1
;	EFM8_JDY40_test.c:117: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	EFM8_JDY40_test.c:130: SFRPAGE=0x10;
	mov	_SFRPAGE,#0x10
;	EFM8_JDY40_test.c:131: TMR4CN0=0x00;   // Stop Timer4; Clear TF4; WARNING: lives in SFR page 0x10
	mov	_TMR4CN0,#0x00
;	EFM8_JDY40_test.c:132: CKCON1|=0b_0000_0001; // Timer 4 uses the system clock
	orl	_CKCON1,#0x01
;	EFM8_JDY40_test.c:133: TMR4RL=(0x10000L-(SYSCLK/(2*TIMER_4_FREQ))); // Initialize reload value
	mov	_TMR4RL,#0xE0
	mov	(_TMR4RL >> 8),#0xE3
;	EFM8_JDY40_test.c:134: TMR4=0xffff;   // Set to reload immediately
	mov	_TMR4,#0xFF
	mov	(_TMR4 >> 8),#0xFF
;	EFM8_JDY40_test.c:135: EIE2|=0b_0000_0100;     // Enable Timer4 interrupts
	orl	_EIE2,#0x04
;	EFM8_JDY40_test.c:136: TR4=1;
	setb	_TR4
;	EFM8_JDY40_test.c:138: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer4_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:141: void Timer4_ISR (void) interrupt INTERRUPT_TIMER4
;	-----------------------------------------
;	 function Timer4_ISR
;	-----------------------------------------
_Timer4_ISR:
;	EFM8_JDY40_test.c:143: SFRPAGE=0x10;
	mov	_SFRPAGE,#0x10
;	EFM8_JDY40_test.c:144: TF4H = 0; // Clear Timer4 interrupt flag
	clr	_TF4H
;	EFM8_JDY40_test.c:145: TIMER_OUT_4=!TIMER_OUT_4;
	cpl	_P3_2
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'PCA_ISR'
;------------------------------------------------------------
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:148: void PCA_ISR (void) interrupt INTERRUPT_PCA0
;	-----------------------------------------
;	 function PCA_ISR
;	-----------------------------------------
_PCA_ISR:
	push	acc
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	psw
	mov	psw,#0x00
;	EFM8_JDY40_test.c:152: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:153: if (CCF4)
	jnb	_CCF4,L004002?
;	EFM8_JDY40_test.c:155: j=(PCA0CPH4*0x100+PCA0CPL4)+(SYSCLK/(2L*PCA_4_FREQ));
	mov	r3,_PCA0CPH4
	mov	r2,#0x00
	mov	r4,_PCA0CPL4
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	r5,a
	mov	a,#0xC8
	add	a,r2
	mov	r2,a
	mov	a,#0x0C
	addc	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	clr	a
	addc	a,r5
;	EFM8_JDY40_test.c:156: PCA0CPL4=j%0x100; //Always write low byte first!
	mov	ar4,r2
	mov	r5,#0x00
	mov	_PCA0CPL4,r4
;	EFM8_JDY40_test.c:157: PCA0CPH4=j/0x100;
	mov	ar2,r3
	mov	r3,#0x00
	mov	_PCA0CPH4,r2
;	EFM8_JDY40_test.c:158: CCF4=0;
	clr	_CCF4
;	EFM8_JDY40_test.c:159: PCA_OUT_4=!PCA_OUT_4;
	cpl	_P0_6
L004002?:
;	EFM8_JDY40_test.c:162: CF=0;
	clr	_CF
	pop	psw
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:165: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	EFM8_JDY40_test.c:167: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:168: ADEN=0; // Disable ADC
	clr	_ADEN
;	EFM8_JDY40_test.c:173: (0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	mov	_ADC0CN1,#0x80
;	EFM8_JDY40_test.c:177: (0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	mov	_ADC0CF0,#0x20
;	EFM8_JDY40_test.c:181: (0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	mov	_ADC0CF1,#0x1E
;	EFM8_JDY40_test.c:190: (0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.
	mov	_ADC0CN0,#0x00
;	EFM8_JDY40_test.c:195: (0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	mov	_ADC0CF2,#0x3F
;	EFM8_JDY40_test.c:199: (0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3
	mov	_ADC0CN2,#0x00
;	EFM8_JDY40_test.c:201: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:206: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	EFM8_JDY40_test.c:211: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	EFM8_JDY40_test.c:213: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	EFM8_JDY40_test.c:214: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	EFM8_JDY40_test.c:216: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	EFM8_JDY40_test.c:217: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L006004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L006007?
;	EFM8_JDY40_test.c:219: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L006001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L006001?
;	EFM8_JDY40_test.c:220: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	EFM8_JDY40_test.c:217: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L006004?
L006007?:
;	EFM8_JDY40_test.c:222: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:225: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	EFM8_JDY40_test.c:227: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	EFM8_JDY40_test.c:228: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	EFM8_JDY40_test.c:229: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:246: void Timer2_ISR (void) //interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
;	EFM8_JDY40_test.c:248: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:249: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	EFM8_JDY40_test.c:250: TIMER_OUT_2=!TIMER_OUT_2;
	cpl	_P3_3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:253: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	EFM8_JDY40_test.c:257: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L009005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L009009?
;	EFM8_JDY40_test.c:258: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L009001?:
	cjne	r6,#0x04,L009018?
L009018?:
	jnc	L009007?
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
	sjmp	L009001?
L009007?:
;	EFM8_JDY40_test.c:257: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L009005?
	inc	r5
	sjmp	L009005?
L009009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:261: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	EFM8_JDY40_test.c:265: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L010013?
L010011?:
	add	a,acc
L010013?:
	djnz	b,L010011?
	mov	r3,a
;	EFM8_JDY40_test.c:267: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:268: switch (portno)
	cjne	r2,#0x00,L010014?
	sjmp	L010001?
L010014?:
	cjne	r2,#0x01,L010015?
	sjmp	L010002?
L010015?:
;	EFM8_JDY40_test.c:270: case 0:
	cjne	r2,#0x02,L010005?
	sjmp	L010003?
L010001?:
;	EFM8_JDY40_test.c:271: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	EFM8_JDY40_test.c:272: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	EFM8_JDY40_test.c:273: break;
;	EFM8_JDY40_test.c:274: case 1:
	sjmp	L010005?
L010002?:
;	EFM8_JDY40_test.c:275: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	EFM8_JDY40_test.c:276: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	EFM8_JDY40_test.c:277: break;
;	EFM8_JDY40_test.c:278: case 2:
	sjmp	L010005?
L010003?:
;	EFM8_JDY40_test.c:279: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	EFM8_JDY40_test.c:280: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	EFM8_JDY40_test.c:284: }
L010005?:
;	EFM8_JDY40_test.c:285: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:288: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	EFM8_JDY40_test.c:291: ADINT = 0;
	clr	_ADINT
;	EFM8_JDY40_test.c:292: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	EFM8_JDY40_test.c:293: while (!ADINT); // Wait for conversion to complete
L011001?:
	jnb	_ADINT,L011001?
;	EFM8_JDY40_test.c:294: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_ADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:297: unsigned int Get_ADC (void)
;	-----------------------------------------
;	 function Get_ADC
;	-----------------------------------------
_Get_ADC:
;	EFM8_JDY40_test.c:299: ADINT = 0;
	clr	_ADINT
;	EFM8_JDY40_test.c:300: ADBUSY = 1;
	setb	_ADBUSY
;	EFM8_JDY40_test.c:301: while (!ADINT); // Wait for conversion to complete
L012001?:
	jnb	_ADINT,L012001?
;	EFM8_JDY40_test.c:302: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:306: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	EFM8_JDY40_test.c:308: return ((ADC_at_Pin(pin)*VDD)/16383);
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
;	EFM8_JDY40_test.c:311: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	EFM8_JDY40_test.c:313: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:314: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	EFM8_JDY40_test.c:315: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	EFM8_JDY40_test.c:316: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	EFM8_JDY40_test.c:317: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
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
;	EFM8_JDY40_test.c:318: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	EFM8_JDY40_test.c:319: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	EFM8_JDY40_test.c:320: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar1'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:323: void putchar1 (char c) 
;	-----------------------------------------
;	 function putchar1
;	-----------------------------------------
_putchar1:
	mov	r2,dpl
;	EFM8_JDY40_test.c:325: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:326: while (!TI1);
L015001?:
;	EFM8_JDY40_test.c:327: TI1=0;
	jbc	_TI1,L015008?
	sjmp	L015001?
L015008?:
;	EFM8_JDY40_test.c:328: SBUF1 = c;
	mov	_SBUF1,r2
;	EFM8_JDY40_test.c:329: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendstr1'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:332: void sendstr1 (char * s)
;	-----------------------------------------
;	 function sendstr1
;	-----------------------------------------
_sendstr1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	EFM8_JDY40_test.c:334: while(*s)
L016001?:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	jz	L016004?
;	EFM8_JDY40_test.c:336: putchar1(*s);
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_putchar1
	pop	ar4
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:337: s++;	
	inc	r2
	cjne	r2,#0x00,L016001?
	inc	r3
	sjmp	L016001?
L016004?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:341: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	EFM8_JDY40_test.c:344: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:345: while (!RI1);
L017001?:
;	EFM8_JDY40_test.c:346: RI1=0;
	jbc	_RI1,L017008?
	sjmp	L017001?
L017008?:
;	EFM8_JDY40_test.c:348: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	EFM8_JDY40_test.c:349: c = SBUF1;
	mov	dpl,_SBUF1
;	EFM8_JDY40_test.c:350: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:351: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1_with_timeout'
;------------------------------------------------------------
;c                         Allocated to registers 
;timeout                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:354: char getchar1_with_timeout (void)
;	-----------------------------------------
;	 function getchar1_with_timeout
;	-----------------------------------------
_getchar1_with_timeout:
;	EFM8_JDY40_test.c:358: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:360: while (!RI1)
	mov	r2,#0x00
	mov	r3,#0x00
L018003?:
	jb	_RI1,L018005?
;	EFM8_JDY40_test.c:362: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:363: Timer3us(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:364: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:365: timeout++;
	inc	r2
	cjne	r2,#0x00,L018012?
	inc	r3
L018012?:
;	EFM8_JDY40_test.c:366: if(timeout==25000)
	cjne	r2,#0xA8,L018003?
	cjne	r3,#0x61,L018003?
;	EFM8_JDY40_test.c:368: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:369: return ('\n'); // Timeout after half second
	mov	dpl,#0x0A
	ret
L018005?:
;	EFM8_JDY40_test.c:372: RI1=0;
	clr	_RI1
;	EFM8_JDY40_test.c:374: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	EFM8_JDY40_test.c:375: c = SBUF1;
	mov	dpl,_SBUF1
;	EFM8_JDY40_test.c:376: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:377: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getstr1'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;c                         Allocated to registers r5 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:380: void getstr1 (char * s)
;	-----------------------------------------
;	 function getstr1
;	-----------------------------------------
_getstr1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	EFM8_JDY40_test.c:384: while(1)
L019004?:
;	EFM8_JDY40_test.c:386: c=getchar1_with_timeout();
	push	ar2
	push	ar3
	push	ar4
	lcall	_getchar1_with_timeout
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:387: if(c=='\n')
	cjne	r5,#0x0A,L019002?
;	EFM8_JDY40_test.c:389: *s= 0; //was 0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
;	EFM8_JDY40_test.c:390: return;
	ljmp	__gptrput
L019002?:
;	EFM8_JDY40_test.c:392: *s=c;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	EFM8_JDY40_test.c:393: s++;
	sjmp	L019004?
;------------------------------------------------------------
;Allocation info for local variables in function 'RXU1'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:398: bit RXU1 (void)
;	-----------------------------------------
;	 function RXU1
;	-----------------------------------------
_RXU1:
;	EFM8_JDY40_test.c:401: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	EFM8_JDY40_test.c:402: mybit=RI1;
	mov	c,_RI1
;	EFM8_JDY40_test.c:403: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	EFM8_JDY40_test.c:404: return mybit;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms_or_RI1'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:407: void waitms_or_RI1 (unsigned int ms)
;	-----------------------------------------
;	 function waitms_or_RI1
;	-----------------------------------------
_waitms_or_RI1:
	mov	r2,dpl
	mov	r3,dph
;	EFM8_JDY40_test.c:411: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L021007?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L021011?
;	EFM8_JDY40_test.c:413: for (k=0; k<4; k++)
	mov	r6,#0x00
L021003?:
	cjne	r6,#0x04,L021019?
L021019?:
	jnc	L021009?
;	EFM8_JDY40_test.c:415: if(RXU1()) return;
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
	jz	L021002?
	ret
L021002?:
;	EFM8_JDY40_test.c:416: Timer3us(250);
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
;	EFM8_JDY40_test.c:413: for (k=0; k<4; k++)
	inc	r6
	sjmp	L021003?
L021009?:
;	EFM8_JDY40_test.c:411: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L021007?
	inc	r5
	sjmp	L021007?
L021011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SendATCommand'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:421: void SendATCommand (char * s)
;	-----------------------------------------
;	 function SendATCommand
;	-----------------------------------------
_SendATCommand:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	EFM8_JDY40_test.c:423: printf("Command: %s", s);
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
;	EFM8_JDY40_test.c:424: P3_0=0; // 'set' pin to 0 is 'AT' mode.
	clr	_P3_0
;	EFM8_JDY40_test.c:425: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:426: sendstr1(s);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_sendstr1
;	EFM8_JDY40_test.c:427: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_getstr1
;	EFM8_JDY40_test.c:428: waitms(10);
	mov	dptr,#0x000A
	lcall	_waitms
;	EFM8_JDY40_test.c:429: P3_0=1; // 'set' pin to 1 is normal operation mode.
	setb	_P3_0
;	EFM8_JDY40_test.c:430: printf("Response: %s\r\n", buff);
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
;	EFM8_JDY40_test.c:435: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	EFM8_JDY40_test.c:437: LCD_E=1;
	setb	_P2_0
;	EFM8_JDY40_test.c:438: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	EFM8_JDY40_test.c:439: LCD_E=0;
	clr	_P2_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:442: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	EFM8_JDY40_test.c:445: ACC=x; //Send high nible
	mov	_ACC,r2
;	EFM8_JDY40_test.c:446: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	EFM8_JDY40_test.c:447: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	EFM8_JDY40_test.c:448: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	EFM8_JDY40_test.c:449: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	EFM8_JDY40_test.c:450: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	EFM8_JDY40_test.c:451: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	EFM8_JDY40_test.c:452: ACC=x; //Send low nible
	mov	_ACC,r2
;	EFM8_JDY40_test.c:453: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	EFM8_JDY40_test.c:454: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	EFM8_JDY40_test.c:455: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	EFM8_JDY40_test.c:456: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	EFM8_JDY40_test.c:457: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'speaker_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:460: void speaker_pulse(void) 
;	-----------------------------------------
;	 function speaker_pulse
;	-----------------------------------------
_speaker_pulse:
;	EFM8_JDY40_test.c:462: METAL_DECTECT = 0;
	clr	_P3_4
;	EFM8_JDY40_test.c:463: waitms(10);
	mov	dptr,#0x000A
	lcall	_waitms
;	EFM8_JDY40_test.c:464: METAL_DECTECT = 1;
	setb	_P3_4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:467: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	EFM8_JDY40_test.c:469: LCD_RS=1;
	setb	_P1_7
;	EFM8_JDY40_test.c:470: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	EFM8_JDY40_test.c:471: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:474: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	EFM8_JDY40_test.c:476: LCD_RS=0;
	clr	_P1_7
;	EFM8_JDY40_test.c:477: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	EFM8_JDY40_test.c:478: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:481: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	EFM8_JDY40_test.c:483: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_0
;	EFM8_JDY40_test.c:485: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	EFM8_JDY40_test.c:487: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:488: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:489: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:492: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:493: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:494: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:495: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:498: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	EFM8_JDY40_test.c:502: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L029013?
	mov	r5,#0xC0
	sjmp	L029014?
L029013?:
	mov	r5,#0x80
L029014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:503: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:504: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L029003?:
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
	jz	L029006?
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
	cjne	r5,#0x00,L029003?
	inc	r6
	sjmp	L029003?
L029006?:
;	EFM8_JDY40_test.c:505: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L029011?
	mov	ar2,r5
	mov	ar3,r6
L029007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L029011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L029007?
	inc	r3
	sjmp	L029007?
L029011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint2'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint2_PARM_2'
;col                       Allocated with name '_LCDprint2_PARM_3'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	EFM8_JDY40_test.c:508: void LCDprint2(char * string, unsigned char line, unsigned char col)
;	-----------------------------------------
;	 function LCDprint2
;	-----------------------------------------
_LCDprint2:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	EFM8_JDY40_test.c:512: WriteCommand(line==2?0xc0|col:0x80|col); // Move cursor to line and column
	mov	a,#0x02
	cjne	a,_LCDprint2_PARM_2,L030007?
	mov	a,#0xC0
	orl	a,_LCDprint2_PARM_3
	mov	r5,a
	sjmp	L030008?
L030007?:
	mov	a,#0x80
	orl	a,_LCDprint2_PARM_3
	mov	r5,a
L030008?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
	pop	ar4
	pop	ar3
	pop	ar2
;	EFM8_JDY40_test.c:513: for(j=0; string[j]!=0; j++) WriteData(string[j]); // Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L030001?:
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
	jz	L030005?
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
	cjne	r5,#0x00,L030001?
	inc	r6
	sjmp	L030001?
L030005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'thefastestsprintf'
;------------------------------------------------------------
;str                       Allocated with name '_thefastestsprintf_PARM_2'
;index                     Allocated with name '_thefastestsprintf_PARM_3'
;num                       Allocated with name '_thefastestsprintf_num_1_129'
;i                         Allocated with name '_thefastestsprintf_i_1_130'
;------------------------------------------------------------
;	EFM8_JDY40_test.c:516: void thefastestsprintf (int num, char str[], int index) {
;	-----------------------------------------
;	 function thefastestsprintf
;	-----------------------------------------
_thefastestsprintf:
	mov	_thefastestsprintf_num_1_129,dpl
	mov	(_thefastestsprintf_num_1_129 + 1),dph
;	EFM8_JDY40_test.c:519: str[index] = '\0';
	mov	a,_thefastestsprintf_PARM_3
	add	a,_thefastestsprintf_PARM_2
	mov	r4,a
	mov	a,(_thefastestsprintf_PARM_3 + 1)
	addc	a,(_thefastestsprintf_PARM_2 + 1)
	mov	r5,a
	mov	r6,(_thefastestsprintf_PARM_2 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	EFM8_JDY40_test.c:521: for (i = 3; i > 0; i--) {
	mov	_thefastestsprintf_i_1_130,#0x03
	clr	a
	mov	(_thefastestsprintf_i_1_130 + 1),a
L031001?:
	clr	c
	clr	a
	subb	a,_thefastestsprintf_i_1_130
	clr	a
	xrl	a,#0x80
	mov	b,(_thefastestsprintf_i_1_130 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L031004?
;	EFM8_JDY40_test.c:522: str[index -1] = num % 10 + '0';
	mov	a,_thefastestsprintf_PARM_3
	add	a,#0xff
	mov	r6,a
	mov	a,(_thefastestsprintf_PARM_3 + 1)
	addc	a,#0xff
	mov	r7,a
	mov	a,r6
	add	a,_thefastestsprintf_PARM_2
	mov	r0,a
	mov	a,r7
	addc	a,(_thefastestsprintf_PARM_2 + 1)
	mov	r1,a
	mov	r4,(_thefastestsprintf_PARM_2 + 2)
	mov	__modsint_PARM_2,#0x0A
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,_thefastestsprintf_num_1_129
	mov	dph,(_thefastestsprintf_num_1_129 + 1)
	push	ar4
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	__modsint
	mov	r5,dpl
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar4
	mov	a,#0x30
	add	a,r5
	mov	dpl,r0
	mov	dph,r1
	mov	b,r4
	lcall	__gptrput
;	EFM8_JDY40_test.c:523: num/=10;
	mov	__divsint_PARM_2,#0x0A
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,_thefastestsprintf_num_1_129
	mov	dph,(_thefastestsprintf_num_1_129 + 1)
	push	ar6
	push	ar7
	lcall	__divsint
	mov	_thefastestsprintf_num_1_129,dpl
	mov	(_thefastestsprintf_num_1_129 + 1),dph
	pop	ar7
	pop	ar6
;	EFM8_JDY40_test.c:524: index--;
	mov	_thefastestsprintf_PARM_3,r6
	mov	(_thefastestsprintf_PARM_3 + 1),r7
;	EFM8_JDY40_test.c:521: for (i = 3; i > 0; i--) {
	dec	_thefastestsprintf_i_1_130
	mov	a,#0xff
	cjne	a,_thefastestsprintf_i_1_130,L031011?
	dec	(_thefastestsprintf_i_1_130 + 1)
L031011?:
	ljmp	L031001?
L031004?:
;	EFM8_JDY40_test.c:527: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_build_left'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:541: void LCD_build_left(void){
;	-----------------------------------------
;	 function LCD_build_left
;	-----------------------------------------
_LCD_build_left:
;	EFM8_JDY40_test.c:542: WriteCommand(0x48);       //Load the location where we want to store
	mov	dpl,#0x48
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:543: WriteData(0x1f);      //Load row 1 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:544: WriteData(0x10);      //Load row 2 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:545: WriteData(0x13);      //Load row 3 data
	mov	dpl,#0x13
	lcall	_WriteData
;	EFM8_JDY40_test.c:546: WriteData(0x17);      //Load row 4 data
	mov	dpl,#0x17
	lcall	_WriteData
;	EFM8_JDY40_test.c:547: WriteData(0x17);      //Load row 5 data
	mov	dpl,#0x17
	lcall	_WriteData
;	EFM8_JDY40_test.c:548: WriteData(0x13);      //Load row 6 data
	mov	dpl,#0x13
	lcall	_WriteData
;	EFM8_JDY40_test.c:549: WriteData(0x10);      //Load row 7 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:550: WriteData(0x1f);      //Load row 8 data
	mov	dpl,#0x1F
	ljmp	_WriteData
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_build_right'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:553: void LCD_build_right(void){
;	-----------------------------------------
;	 function LCD_build_right
;	-----------------------------------------
_LCD_build_right:
;	EFM8_JDY40_test.c:554: WriteCommand(0x50);       //Load the location where we want to store
	mov	dpl,#0x50
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:555: WriteData(0x1f);      //Load row 1 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:556: WriteData(0x1);      //Load row 2 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:557: WriteData(0x1d);      //Load row 3 data
	mov	dpl,#0x1D
	lcall	_WriteData
;	EFM8_JDY40_test.c:558: WriteData(0x1d);      //Load row 4 data
	mov	dpl,#0x1D
	lcall	_WriteData
;	EFM8_JDY40_test.c:559: WriteData(0x1d);      //Load row 5 data
	mov	dpl,#0x1D
	lcall	_WriteData
;	EFM8_JDY40_test.c:560: WriteData(0x1d);      //Load row 6 data
	mov	dpl,#0x1D
	lcall	_WriteData
;	EFM8_JDY40_test.c:561: WriteData(0x1);      //Load row 7 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:562: WriteData(0x1f);      //Load row 8 data
	mov	dpl,#0x1F
	ljmp	_WriteData
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_build_mid'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:566: void LCD_build_mid(void){
;	-----------------------------------------
;	 function LCD_build_mid
;	-----------------------------------------
_LCD_build_mid:
;	EFM8_JDY40_test.c:567: WriteCommand(0x58);       //Load the location where we want to store
	mov	dpl,#0x58
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:568: WriteData(0x1f);      //Load row 1 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:569: WriteData(0x0);      //Load row 2 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:570: WriteData(0x1f);      //Load row 3 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:571: WriteData(0x1f);      //Load row 4 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:572: WriteData(0x1f);      //Load row 5 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:573: WriteData(0x1f);      //Load row 6 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:574: WriteData(0x0);      //Load row 7 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:575: WriteData(0x1f);      //Load row 8 data
	mov	dpl,#0x1F
	ljmp	_WriteData
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_build_left_empty'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:578: void LCD_build_left_empty(void){
;	-----------------------------------------
;	 function LCD_build_left_empty
;	-----------------------------------------
_LCD_build_left_empty:
;	EFM8_JDY40_test.c:579: WriteCommand(0x60);       //Load the location where we want to store
	mov	dpl,#0x60
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:580: WriteData(0x1f);      //Load row 1 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:581: WriteData(0x10);      //Load row 2 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:582: WriteData(0x10);      //Load row 3 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:583: WriteData(0x10);      //Load row 4 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:584: WriteData(0x10);      //Load row 5 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:585: WriteData(0x10);      //Load row 6 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:586: WriteData(0x10);      //Load row 7 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:587: WriteData(0x1f);      //Load row 8 data
	mov	dpl,#0x1F
	ljmp	_WriteData
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_build_mid_empty'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:590: void LCD_build_mid_empty(void){
;	-----------------------------------------
;	 function LCD_build_mid_empty
;	-----------------------------------------
_LCD_build_mid_empty:
;	EFM8_JDY40_test.c:591: WriteCommand(0x68);       //Load the location where we want to store
	mov	dpl,#0x68
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:592: WriteData(0x1f);      //Load row 1 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:593: WriteData(0x10);      //Load row 2 data
	mov	dpl,#0x10
	lcall	_WriteData
;	EFM8_JDY40_test.c:594: WriteData(0x00);      //Load row 3 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:595: WriteData(0x00);      //Load row 4 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:596: WriteData(0x00);      //Load row 5 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:597: WriteData(0x00);      //Load row 6 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:598: WriteData(0x00);      //Load row 7 data
	mov	dpl,#0x00
	lcall	_WriteData
;	EFM8_JDY40_test.c:599: WriteData(0x1f);      //Load row 8 data
	mov	dpl,#0x1F
	ljmp	_WriteData
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_build_right_empty'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:602: void LCD_build_right_empty(void){
;	-----------------------------------------
;	 function LCD_build_right_empty
;	-----------------------------------------
_LCD_build_right_empty:
;	EFM8_JDY40_test.c:603: WriteCommand(0x70);       //Load the location where we want to store
	mov	dpl,#0x70
	lcall	_WriteCommand
;	EFM8_JDY40_test.c:604: WriteData(0x1f);      //Load row 1 data
	mov	dpl,#0x1F
	lcall	_WriteData
;	EFM8_JDY40_test.c:605: WriteData(0x1);      //Load row 2 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:606: WriteData(0x1);      //Load row 3 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:607: WriteData(0x1);      //Load row 4 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:608: WriteData(0x1);      //Load row 5 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:609: WriteData(0x1);      //Load row 6 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:610: WriteData(0x1);      //Load row 7 data
	mov	dpl,#0x01
	lcall	_WriteData
;	EFM8_JDY40_test.c:611: WriteData(0x1f);      //Load row 8 data
	mov	dpl,#0x1F
	ljmp	_WriteData
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	EFM8_JDY40_test.c:615: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	EFM8_JDY40_test.c:618: }
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

	CSEG

end
