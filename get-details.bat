@ECHO OFF
rem #Author: Bhasker Kamshetty
rem #Description: This script collects hostname, username, serial# & mac address and stores data in Details.txt
rem #Date: 20th February 2024

rem #Appends Hostname
hostname >> Details.txt

rem #Appends Username
whoami >> Details.txt

rem #Appends Serial Number
for /F "skip=1 tokens=4" %%s in ('wmic bios list BRIEF') do echo %%s >> Details.txt

rem #Appends MAC Address
SETLOCAL enabledelayedexpansion
FOR /f "delims=" %%a IN ('getmac /v ^|find /i "Ethernet"') DO (
 FOR %%b IN (%%a) DO (
  SET element=%%b
  IF "!element:~2,1!!element:~5,1!!element:~8,1!"=="---" set mac=%%b
 )
)
ECHO %mac% >> Details.txt
GOTO :EOF
