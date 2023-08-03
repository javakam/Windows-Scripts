@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@echo off
rem --- Base Config 配置JDK的安装目录 ---
:init 
set JAVA_HOME8=C:\fastwork\Java\jdk1.8
set JAVA_HOME17=C:\fastwork\Java\jdk17
:start 
echo 当前使用的JDK 版本: 
java -version 
echo. 
echo ============================================= 
echo jdk版本列表 
echo 1 (1.8)
echo 2 (17)
echo ============================================= 

:select
set /p opt=请选择jdk版本： 
if %opt%==1 (
    set TARGET_JAVA_HOME=%JAVA_HOME8%
)
if %opt%==2 (
    set TARGET_JAVA_HOME=%JAVA_HOME17%
)

echo 当前选择的Java路径:%TARGET_JAVA_HOME%

wmic ENVIRONMENT where "name='JAVA_HOME'" delete
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---
call RefreshEnv

echo 请按任意键退出!
pause>nul

@echo on

rem -- 2023年7月31日 14:18:00 ---