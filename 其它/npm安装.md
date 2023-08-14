
https://blog.csdn.net/zhouyan8603/article/details/109039732

## 配置文件
nodejs配置文件在`C:\Users\XXX\.npmrc`,例如
```
prefix=C:\fastwork\nodejs\node_global
cache=C:\fastwork\nodejs\node_cache
registry=http://registry.npm.taobao.org
```

## 执行命令安装

管理员打开CMD
```
echo %PATH%    看看PATH中有没有`C:\fastwork\nodejs\;`
node -v
npm -v
npm config set prefix "C:\fastwork\nodejs\node_global"
npm config set cache "C:\fastwork\nodejs\node_cache"
npm config set registry=http://registry.npm.taobao.org
npm config get registry
npm info vue 查看vue信息, 此时 node_cache 有东西了

npm list -global     查看配置信息
npm install npm -g   更新npm, -g 指安装到刚才配置的node_global目录下
```

注: 需要设置"系统变量":
`NODE_PATH C:\fastwork\nodejs\node_global\node_modules`

安装vue(管理员打开CMD)
```
npm cache clean --force
npm install vue -g
npm install vue-router -g
npm install vue-cli -g     安装vue脚手架
此时 C:\fastwork\nodejs\node_global 有了vue的一些文件, 需要把该路径添加到Path中!!!!!!
vue -V
```

## 遇到的问题
> Please verify that the package.json has a valid "main" entry这样的错误，一般是没有package.json中的主文件。
因而，我们需要到package.json文件中找到对应的主文件，然后创建该主文件即可。

```
删除项目文件中的package-lock.json文件
运行命令npm install
重新启动项目

或

删除node_modules和package-lock.json这两个文件
命令行输npm i会重新下载包
nodemon xxx.js重新执行检查没有报错
```