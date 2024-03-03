@echo off

netsh interface ipv4 set address "WLAN" dhcp

netsh interface ipv4 set dns "WLAN" dhcp

pause