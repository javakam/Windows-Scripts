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

echo Starting QQ...
start "" "C:\Program Files\Tencent\QQNT\QQ.exe"
::start "" "C:\Program Files (x86)\Tencent\QQ\Bin\QQScLauncher.exe"
::当使用代理软件时 ping 127.0.0.1 会报错
::ping -n 1 -w 100 192.168.1.1 >nul

echo Starting WeChat...
start "" "C:\Program Files\Tencent\WeChat\WeChat.exe"

echo Starting 浏览器...
start /max C:\Users\MaChangBao\AppData\Local\360ChromeX\Chrome\Application\360ChromeX.exe

echo Starting 向日葵...
start "" "C:\Program Files\Oray\SunLogin\SunloginClient\SunloginClient.exe"

echo Starting 哔哩哔哩...
start "" "C:\Program Files\bilibili\哔哩哔哩.exe"

echo.-----------------------------------------------------------

::echo Starting idea64...
::start "" "C:\fastwork\JetBrains\IntelliJ IDEA 2023.1.5\bin\idea64.exe"

echo Starting phpstorm64...
start "" "C:\fastwork\JetBrains\PhpStorm 2024.2\bin\phpstorm64.exe"

::echo Starting Android Studio...
::start "" C:\fastwork\android-studio\bin\studio64.exe

::echo Starting 微信开发者工具...
::start "" C:\fastwork\微信web开发者工具\微信开发者工具.exe

::echo Starting PhpStudy...
::start "" "C:\fastwork\phpstudy_pro\COM\phpstudy_pro.exe"

:end
echo 执行完成

::2023年7月28日 09:55:39 zhitai pc500 1T