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
echo ��������
echo 1 (��������)
echo 2 (�رշ���)
echo ============================================= 

:select
set /p opt=��ѡ�������
if %opt%==1 (
    echo ��������
	net start "TosHddscSvc"
)
if %opt%==2 (
    echo �رշ���
	net stop "TosHddscSvc"
)

::pause
setlocal enabledelayedexpansion

echo ִ�н������ű�5����Զ��˳�...

set /a count=5
:loop
echo ʣ��ʱ�䣺%count% ��
timeout /t 1 >nul
set /a count-=1
if %count% gtr 0 (
    goto loop
) else (
    echo �ű��˳�
)

endlocal
exit
