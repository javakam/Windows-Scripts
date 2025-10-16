@echo off
echo 系统将在20分钟后自动锁屏...
echo 按任意键取消锁屏计划
echo.

REM 设置20分钟的延时（20分钟 = 1200秒）
timeout /t 10 /nobreak >nul

REM 如果用户没有按键中断，则执行锁屏
rundll32.exe user32.dll,LockWorkStation

echo 系统已锁屏
pause