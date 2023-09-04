2023年8月7日 17:07:28

掘金地址: [https://juejin.cn/post/7260457485478723584](https://juejin.cn/post/7260457485478723584)

Windows常用脚本放到了`Gitee`。项目地址👉[https://gitee.com/javakam/windows-script](https://gitee.com/javakam/windows-script)

### 常用脚本(Batchfile & VBScript)

#### 1. `一键启动.bat`
一次双击开启多个软件, 不用逐个软件双击打开, 非常方便！

```vb
@echo off
mode con lines=30 cols=100
title= 一键启动
:main
cls
color 2e
echo %time%
echo.Martin's Blog  https://javakam.github.io

color 1f
echo.-----------------------------------------------------------

echo Starting QQ...
start "" "C:\Program Files (x86)\Tencent\QQ\Bin\QQScLauncher.exe"

echo Starting WeChat...
start "" "C:\Program Files\Tencent\WeChat\WeChat.exe"

:end
echo 执行完成
```
#### 2. `Win11改用传统右键菜单.bat`
切换Win11的右键菜单 或 Win10旧版菜单。例如切换到Win10旧版右键菜单:

```vb
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
echo 右键菜单类型
echo 1 (Win10旧版右键菜单)
echo 2 (Win11新版右键菜单)
echo ============================================= 

:select
set /p opt=请选择操作：
if %opt%==1 (
    echo 正在开启Win10旧版右键菜单》》》》》》》》》
	reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
)
if %opt%==2 (
    echo 正在恢复Win11新版右键菜单》》》》》》》》》
	reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
)

@echo off
echo *************************************
echo *                                   *
echo *          重启任务管理器...        *
echo *                                   *
echo *************************************
taskkill /f /im explorer.exe & start explorer.exe

pause
```

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8fd8f148f6aa4af68b46717de3b40976~tplv-k3u1fbpfcp-watermark.image?)

两种菜单样式随时切换, 很方便。

#### 3. `Java多版本切换`
①以java1.8和java17为例, 目录结构为:

![Java多版本切换_20230731143207.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/87f5750f2bd84cb18823ac2305abebcb~tplv-k3u1fbpfcp-watermark.image?)

②环境变量配置

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/37c05322f1674906805878b635bf39b9~tplv-k3u1fbpfcp-watermark.image?)

`Path`:

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7c99d4c798a649f7a62816a5a5baf7c2~tplv-k3u1fbpfcp-watermark.image?)

③`SwitchJDK.bat`源码及运行效果:

```vb
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
```

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e9564de68a394de4b44135e14b41f0ae~tplv-k3u1fbpfcp-watermark.image?)

注: 修改环境变量后, 必须使用`Win+R`打开`cmd`的新窗口,再输入`java -version`进行验证才准确。此时`Android Studio`中的`Terminal`验证显示仍是旧的`java`环境, 重启AS即可。

#### 4. `Windows设置/取消定时关机`

`定时关机3H.bat`

```vb
Shutdown -s -t 10800
```

`取消定时关机.bat`

```vb
Shutdown -a
```

#### 5. 控制某个服务的开启/关闭
以某品牌移动硬盘的服务为例: 右键开始选择`计算机管理`->`服务和应用程序`中双击`服务`->找到指定`服务`并查看属性

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/36ac03d2ec2640d3bcba7ce1e781e949~tplv-k3u1fbpfcp-watermark.image?)

把服务名称放到`net start/stop `后面即可:

```vb
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
```

执行效果(此处设置了bat倒计时自动退出):

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/baa96353fcb14027b741a644edb37c92~tplv-k3u1fbpfcp-watermark.image?)


![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bacf4dcc2b78471c8de94c9c0eb16abb~tplv-k3u1fbpfcp-watermark.image?)


### 设置开机启动脚本
就两步:
①新建`xxx.vbs`, 设置需要开机启动的`bat`文件名:
```vb
set ws=wscript.createobject("wscript.shell")
ws.run "xxxxxx.bat /start",0
```
②把`vbs`脚本源文件或`快捷方式`放到

`C:\Users\用户名\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` (`Win+R`输入`shell:startup` 可快速打开)

目录下, 开机后会自动执行。如下图所示:

![开机启动设置vbs.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3c9365cdf82a4eee8b60e74576203f15~tplv-k3u1fbpfcp-watermark.image?)

#### 附1 `jupyter`开机启动`vbs`

`jupyter_startup.vbs`

```vbs
Dim wsh
Set wsh = createobject("wscript.Shell")
'1. 使用配置文件启动 jupyter_notebook_config.py
'wsh.run "cmd /c jupyter notebook --no-browser", 0, true
'2. 直接进入路径启动[推荐]
wsh.run "cmd /c jupyter notebook --notebook-dir='C:\fastwork\Python\JupyterNotebook' --no-browser", 0, true
Set wsh = Nothing
```
#### 附2 `redis`开机启动`vbs`
`service_redis_startup.vbs`

```vbs
set ws=wscript.createobject("wscript.shell")
ws.run "service_start.bat /start",0
```

`service_start.bat`

```vb
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
```

### 常用jar包

源码地址: <https://gitee.com/javakam/FileCleaner>

使用方法: `java -jar xxx.jar`

`FileCleaner.jar`  用于清理`Android/Java`项目的临时编译目录,如build classes target 等

`FileSizeCalculator.jar`  用于查看目录中所有文件的大小,目前仅支持MB为单位,便于删除大文件


### 下载地址

[https://gitee.com/javakam/windows-script](https://gitee.com/javakam/windows-script)

















