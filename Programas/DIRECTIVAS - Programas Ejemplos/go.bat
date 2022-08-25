@echo off
:set file="trian"
if exist %1.o del %1.o
if not exist %1.asm goto errasm

path d:\mingw64\bin

nasm -f win64 -o %1.o %1.asm
if errorlevel 1 goto errasm

gcc64.exe -Og -o %1.exe %1.o
if errorlevel 1 goto errlink

if exist %1.o del %1.o
goto TheEnd

:errlink
echo _
echo Link error
pause
goto TheEnd

:errasm
echo _
echo Assembly Error
pause
goto TheEnd

:TheEnd
echo _

