Dim wsh
Set wsh = createobject("wscript.Shell")
'1. 使用配置文件启动 jupyter_notebook_config.py
'wsh.run "cmd /c jupyter notebook --no-browser", 0, true
'2. 直接进入路径启动[推荐]
wsh.run "cmd /c jupyter notebook --notebook-dir='C:\fastwork\Python\JupyterNotebook' --no-browser", 0, true
Set wsh = Nothing