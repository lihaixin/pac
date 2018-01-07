
##介绍

[pac](1) 在线修改代理黑白名单，支持http 和socks5代理
   
##运行

	docker run -d --name pac -p 1901:1901 lihaixin/pac


##自定义黑白名单


	$docker exec -it pac bash
	$cd /go/src/github.com/txthinking/pac/
	$ ./addWhite.sh china.com
	$ ./removeWhite.sh china.com
	$./ addBlack.sh google.com
	$./ removeBlack.sh google.com

域名：请使用第一层顶级域名 如`google.com`

##用法

假设地址为：`http://<URL>:1901`  ，  代理为`socks5//127.0.0.1:1080`或者`http//127.0.0.1:8118`，具体使替换自己的网站替换`<URL>`

	http://<URL>:1901/:MODE/:PROXY

MODE支持三种：
	
	white: 域名在white.list 的直连，其他都通过代理访问
	black: 域名在black.list通过代理访问，其他都直连
	all: 全局代理，所有域名都通过代理访问

PROXY：

	DIRECT  直连
	PROXY 127.0.0.1:8888 HTTP代理
	SOCKS5 127.0.0.1:8888; SOCKS 127.0.0.1:8888  Socks5代理
	
举例：

	白名单：http://<URL>:1901/white/SOCKS5%20127.0.0.1:1080;%20SOCKS%20127.0.0.1:1080   (推荐）
	黑名单：http://<URL>:1901/black/SOCKS5%20127.0.0.1:1080;%20SOCKS%20127.0.0.1:1080
	全局模式：http://<URL>:1901/all/PROXY%20127.0.0.1:8118 （http全局代理）
	
## 感谢
- https://github.com/txthinking/pac

 
