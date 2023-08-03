::启动redis的命令
@echo off
::这是简单的输出，相当于java中的system.out.println()
echo redis-server start......
::设置启动窗口的标题
title redis-server
::定义一个变量ENV_HOME
set ENV_HOME="C:\fastwork\Redis"
C:
::设置启动窗口的颜色
color 0a
cd %ENV_HOME%
redis-server.exe redis.windows.conf
exit