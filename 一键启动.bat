@echo off
mode con lines=30 cols=100
title= 一键启动
:main
cls
color 2e
echo %time%
echo.Martin's Blog  https://javakam.github.io

color 1f
echo.-----------------------------------------------------------

::echo Starting PhpStudy...
::start "" "C:\fastwork\phpstudy_pro\COM\phpstudy_pro.exe"

echo Starting QQ...
start "" "C:\Program Files (x86)\Tencent\QQ\Bin\QQScLauncher.exe"

echo Starting WeChat...
start "" "C:\Program Files\Tencent\WeChat\WeChat.exe"

::echo Starting Android Studio...
::start "" "C:\Users\ChangBao\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\studio64.lnk"

echo Starting 微信开发者工具...
start "" C:\fastwork\微信web开发者工具\微信开发者工具.exe


:end
echo 执行完成

::2023年7月28日 09:55:39 zhitai pc500 1T