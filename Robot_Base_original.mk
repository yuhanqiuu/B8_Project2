SHELL=cmd
CC = xc32-gcc
OBJCPY = xc32-bin2hex
ARCH = -mprocessor=32MX130F064B
OBJ = Robot_Base_original.o
PORTN=$(shell type COMPORT.inc)

Robot_Base_original.elf: $(OBJ)
	$(CC) $(ARCH) -o Robot_Base_original.elf Robot_Base_original.o -mips16 -DXPRJ_default=default -legacy-libc -Wl,-Map=Robot_Base.map
	$(OBJCPY) Robot_Base_original.elf
	@echo Success!
   
Robot_Base_original.o: Robot_Base_original.c
	$(CC) -mips16 -g -x c -c $(ARCH) -MMD -o Robot_Base_original.o Robot_Base_original.c -DXPRJ_default=default -legacy-libc

clean:
	@del *.o *.elf *.hex *.d *.map 2>NUL
	
LoadFlash:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	pro32.exe -p Robot_Base_original.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: Robot_Base_original.hex Robot_Base_original.map
	$(CC) --version

explorer:
	@explorer .