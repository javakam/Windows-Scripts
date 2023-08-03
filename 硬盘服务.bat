@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )


@echo off
echo. 
echo ============================================= 
echo 操作类型
echo 1 (开启服务)
echo 2 (关闭服务)
echo ============================================= 

:select
set /p opt=请选择操作：
if %opt%==1 (
    echo 开启服务
	net start "TosHddscSvc"
)
if %opt%==2 (
    echo 关闭服务
	net stop "TosHddscSvc"
)

::pause
setlocal enabledelayedexpansion

echo 执行结束，脚本5秒后自动退出...

set /a count=5
:loop
echo 剩余时间：%count% 秒
timeout /t 1 >nul
set /a count-=1
if %count% gtr 0 (
    goto loop
) else (
    echo 脚本退出
)

endlocal
exit
