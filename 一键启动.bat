@echo off
mode con lines=30 cols=100
title= һ������
:main
cls
color 2e
echo %time%
echo.Martin's Blog  https://javakam.github.io

color 1f
echo.-----------------------------------------------------------

echo Starting idea64...
start "" "C:\fastwork\JetBrains\IntelliJ IDEA 2023.1.5\bin\idea64.exe"

timeout /t 0.1 /nobreak >nul

::echo Starting Android Studio...
::start "" C:\fastwork\android-studio\bin\studio64.exe

::echo Starting ΢�ſ����߹���...
::start "" C:\fastwork\΢��web�����߹���\΢�ſ����߹���.exe

echo Starting QQ...
start "" "C:\Program Files\Tencent\QQNT\QQ.exe"
::start "" "C:\Program Files (x86)\Tencent\QQ\Bin\QQScLauncher.exe"
timeout /t 0.1 /nobreak >nul

echo Starting WeChat...
start "" "C:\Program Files\Tencent\WeChat\WeChat.exe"
timeout /t 0.1 /nobreak >nul

echo Starting �����...
start "" C:\Users\MaChangBao\AppData\Local\360ChromeX\Chrome\Application\360ChromeX.exe
timeout /t 0.1 /nobreak >nul

echo Starting ���տ�...
start "" "C:\Program Files\Oray\SunLogin\SunloginClient\SunloginClient.exe"
timeout /t 0.1 /nobreak >nul

echo Starting ��������...
start "" "C:\Program Files\bilibili\��������.exe"
timeout /t 0.1 /nobreak >nul

::echo Starting PhpStudy...
::start "" "C:\fastwork\phpstudy_pro\COM\phpstudy_pro.exe"
::timeout /t 0.1 /nobreak >nul

:end
echo ִ�����

::2023��7��28�� 09:55:39 zhitai pc500 1T