@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@echo off
echo. 
echo ============================================= 
echo 定时关机
echo 0(取消所有定时关机)
echo 1小时(3600)
echo 2小时(7200)
echo 3小时(10800)
echo 4小时(14400)
echo 5小时(18000)
echo 6小时(21600)
echo 7小时(25200)
echo 8小时(28800)
echo 9小时(32400)
echo 10小时(36000)
echo ============================================= 

:prompt
:select
set /p opt=请选择：
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
   echo 输入无效！请输入有效的选择。
   goto prompt
)

setlocal enabledelayedexpansion

if %SHUTDOWN_DELAY%==0 (
	echo 已取消所有自动关机！！！
	Shutdown -a
)else (
	echo %SHUTDOWN_DELAY%小时后自动关机》》》》》》》》》
	set /a result=%SHUTDOWN_DELAY% * 3600
	Shutdown -s -f -t !result!
)

echo 操作已完成！可再次修改设置。
goto prompt

::pause