https://blog.csdn.net/qq_40183053/article/details/106344702

git remote set-url --add origin https://github.com/javakam/Windows-Scripts.git

git remote -v

删除远程地址           git remote rm origin
更新为新远程仓库地址    git remote add origin 新远程仓库地址

git config --global -e

Git默认配置文件为 C:\Users\MaChangBao\.gitconfig
Git当前项目配置文件在 .git\config

[core]
	repositoryformatversion = 0
	filemode = false
	bare = false
	logallrefupdates = true
	symlinks = false
	ignorecase = true
[remote "origin"]
	url = https://gitee.com/javakam/windows-script.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[gui]
	wmstate = normal
	geometry = 1053x483+208+208 189 218
[remote "github"]
	url = https://github.com/javakam/Windows-Scripts.git
	fetch = +refs/heads/*:refs/remotes/github/*