@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Yu204\OneDrive\Documents\UBC courses\Second Year\ELEC 291\codes\project2\B8_Project2\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Yu204\OneDrive\Documents\UBC courses\Second Year\ELEC 291\codes\project2\B8_Project2\EFM8_JDY40_test_orignial.c"
if not exist hex2mif.exe goto done
if exist EFM8_JDY40_test_orignial.ihx hex2mif EFM8_JDY40_test_orignial.ihx
if exist EFM8_JDY40_test_orignial.hex hex2mif EFM8_JDY40_test_orignial.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Yu204\OneDrive\Documents\UBC courses\Second Year\ELEC 291\codes\project2\B8_Project2\EFM8_JDY40_test_orignial.hex
