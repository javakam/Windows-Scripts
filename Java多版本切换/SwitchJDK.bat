@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@echo off
rem --- Base Config ����JDK�İ�װĿ¼ ---
:init 
set JAVA_HOME8=C:\fastwork\Java\jdk1.8
set JAVA_HOME17=C:\fastwork\Java\jdk17
:start 
echo ��ǰʹ�õ�JDK �汾: 
java -version 
echo. 
echo ============================================= 
echo jdk�汾�б� 
echo 1 (1.8)
echo 2 (17)
echo ============================================= 

:select
set /p opt=��ѡ��jdk�汾�� 
if %opt%==1 (
    set TARGET_JAVA_HOME=%JAVA_HOME8%
)
if %opt%==2 (
    set TARGET_JAVA_HOME=%JAVA_HOME17%
)

echo ��ǰѡ���Java·��:%TARGET_JAVA_HOME%

wmic ENVIRONMENT where "name='JAVA_HOME'" delete
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---
call RefreshEnv

echo �밴������˳�!
pause>nul

@echo on

rem -- 2023��7��31�� 14:18:00 ---