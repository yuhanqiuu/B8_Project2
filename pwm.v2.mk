SHELL=cmd
CC = xc32-gcc
OBJCPY = xc32-bin2hex
ARCH = -mprocessor=32MX130F064B
OBJ = pwm_v2.o
PORTN=$(shell type COMPORT.inc)

pwm_v2.elf: $(OBJ)
	$(CC) $(ARCH) -o pwm_v2.elf pwm_v2.o -mips16 -DXPRJ_default=default -legacy-libc -Wl,-Map=pwm_v2.map
	$(OBJCPY) pwm_v2.elf
	@echo Success!
   
pwm_v2.o: pwm_v2.c
	$(CC) -mips16 -g -x c -c $(ARCH) -MMD -o pwm_v2.o pwm_v2.c -DXPRJ_default=default -legacy-libc

clean:
	@del *.o *.elf *.hex *.d *.map 2>NUL
	
LoadFlash:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	pro32.exe -p pwm_v2.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: pwm_v2.hex pwm_v2.map
	$(CC) --version

explorer:
	@explorer .