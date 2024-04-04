@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\speaktest.c"
if not exist hex2mif.exe goto done
if exist speaktest.ihx hex2mif speaktest.ihx
if exist speaktest.hex hex2mif speaktest.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\qiuyu\OneDrive\Documents\GitHub\B8_Project2\speaktest.hex
