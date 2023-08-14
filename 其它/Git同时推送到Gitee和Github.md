=================== 流程 ===================

<https://blog.csdn.net/qq_40183053/article/details/106344702>

1.初始化时默认绑定Gitee远程连接
`git remote add origin https://gitee.com/javakam/windows-script.git`

2.绑定GitHub
`git remote set-url --add origin https://github.com/javakam/Windows-Scripts.git`

3.查看所有远程仓库  `git remote -v`

4.当前项目config
```
[remote "origin"]
	url = https://gitee.com/javakam/windows-script.git
	fetch = +refs/heads/*:refs/remotes/origin/*
	url = https://github.com/javakam/Windows-Scripts.git
```
	
=================== 其它 ===================

Git默认配置文件为 `C:\Users\MaChangBao\.gitconfig`

Git当前项目配置文件在 `.git\config`

```
删除远程地址           git remote rm origin
更新为新远程仓库地址    git remote add origin 新远程仓库地址
查看配置             git config --list
```