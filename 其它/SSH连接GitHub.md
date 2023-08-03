# 使用SSH连接GitHub
# 参考文档 👉 https://www.cnblogs.com/hzhhhbb/p/13937628.html

## GitBash 中
git config --global user.name ‘javakam’
git config --global user.email ‘jooybao@foxmail.com’
ssh-keygen -t rsa -b 4096 -C "jooybao@foxmail.com"

#### 设置`id_rsa`路径
> 自定义路径格式为`/c/fastwork/.ssh/id_rsa`, 建议默认路径

```
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/ChangBao/.ssh/id_rsa):
Created directory '/c/Users/ChangBao/.ssh'.
```
#### 设置密码
> 直接跳过即可

```
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/fastwork/.ssh/id_rsa
Your public key has been saved in /c/fastwork/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:YcDSUbJxNV44WlmrO31TKMjllWjemxdbAT1BRftGctI jooybao@foxmail.com
The key's randomart image is:
+---[RSA 4096]----+
|     o=oo.o+o.o+=|
|    . o* .=o o.=.|
|     .. oo..= =oE|
|       ..o B o *o|
|        S + + o.=|
|           o . =+|
|          o . =..|
|           . . o |
|                 |
+----[SHA256]-----+
```
#### 把 SSh Key 添加到 ssh-agent
```
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
```
#### 复制SSH Key
```
clip < ~/.ssh/id_rsa.pub
```

#### Github 设置SSH Key
<https://github.com/settings/ssh/new>

## Android Studio Terminal 中
```
git remote -v
git remote set-url origin git@github.com:javakam/AndoTemplate.git
git remote -v
```

---
