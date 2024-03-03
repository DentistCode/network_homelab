:: 代码页改为Unicode(UTF-8)
chcp 65001
@echo off
set "interfaceName=以太网"

REM 检查当前的IP设置
for /f "tokens=3" %%a in ('netsh interface ip show config name^="%interfaceName%" ^| findstr "DHCP Enabled"') do set "dhcpStatus=%%a"

if "%dhcpStatus%"=="Yes" (
    echo 当前是DHCP，正在切换到静态IP...
    REM 以下属性值可以根据需要更改
    set "ipAddress=192.168.50.104"
    set "subnetMask=255.255.255.0"
    set "gateway=192.168.50.3"
    set "dns1=192.168.50.3"
    netsh interface ip set address name="%interfaceName%" static %ipAddress% %subnetMask% %gateway%
    netsh interface ip set dns name="%interfaceName%" static %dns1%
    echo 已切换到静态IP
) else (
    echo 当前是静态IP，正在切换到DHCP...
    netsh interface ip set address name="%interfaceName%" dhcp
    netsh interface ip set dns name="%interfaceName%" dhcp
    echo 已切换到DHCP
)
    pause
