:: Windows10中，由于安全限制无法通过批处理脚本直接开启移动热点, 但是可以通过批处理脚本快速打开Win10的移动热点页面
:: Win+R 打开cmd输入 shell:startup , 把该脚本的快捷方式放到开机启动里面
@echo off
start ms-settings:network-mobilehotspot