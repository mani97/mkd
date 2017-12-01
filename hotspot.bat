@echo off
:CONFIRM
echo select what you want from me(on-N/off-F/details-D)
set /p "cho=>"
if %cho%==on goto on
if %cho%==N goto on
if %cho%==n goto on
if %cho%==F goto off
if %cho%==f goto off
if %cho%==off goto off
if %cho%==details goto details
if %cho%==ON goto on
if %cho%==OFF goto off
if %cho%==DETAILS goto details
if %cho%==d goto details
if %cho%==D goto details
if %cho%==C goto connected clients
if %cho%==connected clients goto connected clients
if %cho%==CONNECTED CLIENTS goto connected clients
if %cho%==c goto connected clients
goto invalid choice.
goto CONFIRM
:details
netsh wlan show hostednetwork | findstr -i status
echo SSID Name
netsh wlan show hostednetwork | findstr -i " ssid "
netsh wlan show hostednetwork setting=security
:on
netsh wlan set hostednetwork mode=allow ssid=MK-WIFI key=superuser456
netsh wlan start hostednetwork
:CONFIRM
echo select what you want from me(off-F/connected clients-c)
set /p "cho=>"
if %cho%==off goto off
if %cho%==F goto off
if %cho%==f goto off
if %cho%==d goto details
if %cho%==D goto details
if %cho%==C goto connected clients
if %cho%==connected clients goto connected clients
if %cho%==CONNECTED CLIENTS goto connected clients
if %cho%==c goto connected clients
if %cho%==OFF goto off
goto invalid choice.
goto CONFIRM 
:off
netsh wlan stop hostednetwork
goto end
:connected clients
netsh wlan show hostednetwork | findstr -i status
echo SSID Name
netsh wlan show hostednetwork | findstr -i " ssid "
netsh wlan show hostednetwork setting=security
echo Connected clients
arp -a | findstr -i 192.168.173 | findstr /V 255 | findstr /V 192.168.173.1
:CONFIRM
echo select what you want from me(off-F)
set /p "cho=>"
if %cho%==off goto off
if %cho%==OFF goto off
if %cho%==f goto off
if %cho%==F goto off
goto invalid choice.
goto CONFIRM 
:off
netsh wlan stop hostednetwork
goto end
