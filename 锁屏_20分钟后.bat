@echo off
echo ϵͳ����20���Ӻ��Զ�����...
echo �������ȡ�������ƻ�
echo.

REM ����20���ӵ���ʱ��20���� = 1200�룩
timeout /t 10 /nobreak >nul

REM ����û�û�а����жϣ���ִ������
rundll32.exe user32.dll,LockWorkStation

echo ϵͳ������
pause