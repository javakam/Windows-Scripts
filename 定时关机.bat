@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@echo off
echo. 
echo ============================================= 
echo ��ʱ�ػ�
echo 0(ȡ�����ж�ʱ�ػ�)
echo 1Сʱ(3600)
echo 2Сʱ(7200)
echo 3Сʱ(10800)
echo 4Сʱ(14400)
echo 5Сʱ(18000)
echo 6Сʱ(21600)
echo 7Сʱ(25200)
echo 8Сʱ(28800)
echo 9Сʱ(32400)
echo 10Сʱ(36000)
echo ============================================= 

:prompt
:select
set /p opt=��ѡ��
if %opt%==0 (
	set SHUTDOWN_DELAY=0
)else if %opt%==1 (
	set SHUTDOWN_DELAY=1
)else if %opt%==2 (
	set SHUTDOWN_DELAY=2
)else if %opt%==3 (
	set SHUTDOWN_DELAY=3
)else if %opt%==4 (
	set SHUTDOWN_DELAY=4
)else if %opt%==5 (
	set SHUTDOWN_DELAY=5
)else if %opt%==6 (
	set SHUTDOWN_DELAY=6
)else if %opt%==7 (
	set SHUTDOWN_DELAY=7
)else if %opt%==8 (
	set SHUTDOWN_DELAY=8
)else if %opt%==9 (
	set SHUTDOWN_DELAY=9
)else if %opt%==10 (
	set SHUTDOWN_DELAY=10
)else (
   echo ������Ч����������Ч��ѡ��
   goto prompt
)

setlocal enabledelayedexpansion

if %SHUTDOWN_DELAY%==0 (
	echo ��ȡ�������Զ��ػ�������
	Shutdown -a
)else (
	echo %SHUTDOWN_DELAY%Сʱ���Զ��ػ�������������������
	set /a result=%SHUTDOWN_DELAY% * 3600
	Shutdown -s -f -t !result!
)

echo ��������ɣ����ٴ��޸����á�
goto prompt

::pause