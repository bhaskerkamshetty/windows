@ECHO OFF
rem #Author: Bhasker Kamshetty
rem #Description: This script changes hostname, renames administrator, enables administrator, sets password to administrator, deletes initial user
rem #Date: 20th February 2024

set /p hostname=Enter Hostname: 
wmic computersystem where name="%computername%" call rename name="DESKTOP-%hostname%"
wmic useraccount where name='Administrator' rename 'NEWUSERNAME'
net user NEWUSERNAME /active:yes
net user NEWUSERNAME PASSWORD
net user INITIALUSERNAME /delete
shutdown -r
