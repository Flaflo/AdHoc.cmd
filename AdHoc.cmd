::AdHoc.cmd Copyright (c) 2018 Flaflo
::This file is distributed under the MIT License
::Which can be read at "LICENSE.md" that should be shipped along file
@echo off
::If the first argument is not empty jump to the desired command
if not "%1" == "" goto %1%
goto usage
:setup
::Set default variable values
set ssid=AdHoc
set key=123456789
::Request user input for variables that where not set from parameters, quotes added for visibility of spaces
if "%2" == "" (set /p "ssid=SSID: ") else (set ssid=%2)
if "%3" == "" (set /p "key=Key: ") else (set key=%3)
::Write ini to file
echo ssid=%ssid%>adhoc.ini&echo.key=%key%>>adhoc.ini
goto reload
:reload
::Setup ini default ini if not already exists and read into batch variables
if not exist adhoc.ini echo ssid=AdHoc>adhoc.ini&echo.key=12346789>>adhoc.ini
for /f "tokens=*" %%i in (adhoc.ini) do set %%i
::Apply config on hosted network
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
echo Changes to the network applied.
goto end
:status
::Print general information about the network
netsh wlan show hostednetwork | findstr /i status
netsh wlan show hostednetwork | findstr /i " ssid "
netsh wlan show hostednetwork setting=security | findstr /i /v /c:"--------------------------------"
::Print all devices connected to the network
echo Connected Devices
::There may be cases where "192.168.137" is not the chosen private network IP and therefore needs adjustment here!
arp -a | findstr /i 192.168.137 | findstr /i /v 192.168.137.255 | findstr /i /v /e 0xe 
goto end
:start
::Start the network
netsh wlan start hostednetwork
goto end
:stop
::Stop the network
netsh wlan stop hostednetwork
goto end
:usage
::Print usage of this program
echo AdHoc Usage:
echo adhoc setup  - Runs a setup for the Ad Hoc network
echo adhoc reload - Applies the config to the Ad Hoc network
echo adhoc status - Shows the status of the Ad Hoc network
echo adhoc start  - Starts the Ad Hoc network
echo adhoc stop   - Stops the Ad Hoc network
:end