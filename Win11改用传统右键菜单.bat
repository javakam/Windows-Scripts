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
echo �Ҽ��˵�����
echo 1 (Win10�ɰ��Ҽ��˵�)
echo 2 (Win11�°��Ҽ��˵�)
echo ============================================= 

:select
set /p opt=��ѡ�������
if %opt%==1 (
    echo ���ڿ���Win10�ɰ��Ҽ��˵�������������������
	reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
)
if %opt%==2 (
    echo ���ڻָ�Win11�°��Ҽ��˵�������������������
	reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
)

@echo off
echo *************************************
echo *                                   *
echo *          �������������...        *
echo *                                   *
echo *************************************
taskkill /f /im explorer.exe & start explorer.exe

pause