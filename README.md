# SpringCloudBook
本工程为《Spring Cloud实战》一书的配套示例代码

# 目录说明

## 01-spring-boot-hello springboot入门
运行
mvn_springbootrun.bat 
访问： http://localhost:8881/hello

## 02-1-eureka-server 服务注册
运行 mvn_springbootrun.bat
访问： http://localhost:1111/

## 02-2-hello-services
运行 mvn_springbootrun.bat
访问： http://localhost:8881/hello

## 03-1-many-eureka 多个eureka服务互相注
先添加C:\Windows\System32\drivers\etc\hosts文件内容如下：  
127.0.0.1      peer1  
127.0.0.1      peer2  
127.0.0.1      peer3  
然后运行  
mvn clean  
mvn package  
runpeer1.bat  
runpeer2.bat  
访问： http://localhost:1111/
访问： http://localhost:1112/

 ## 03-2-hello-services 服务提供者
运行  
mvn clean  
mvn package  
run8881.bat
run8882.bat
run8883.bat
访问： http://localhost:8881/hello
访问： http://localhost:8882/hello
访问： http://localhost:8883/hello

## 03-3-ribbon-consumer 服务消费者
运行  
mvn clean  
mvn package  
mvn_springbootrun.bat 
访问：http://localhost:9000/ribbon-consumer

一些配置说明：
Service提供者：
eureka.client.register-with-eureka=true （为默认，下同)，如设为false将不注册
eureka.instance.lease-renewal-interval-in-seconds=30 设定续约时间
eureka.instance.lease-expiration-duration-in-seconds=90 设定过期时间

Ribbon消费者：
eureka.client.fetch-registry=true  获取服务清单list
eureka.client.registry-fetch-interval-seconds=30 设定获取服务间隔

eureka服务:
eureka. server.enable-self-preservation=true 缺省是开启自我保护，如关闭将会踢除不活动的服务
eureka.client.rigion 定义rigion
eureka.client.serviceUrl.defaultZone 定义zone
eureka.client.availability-zones 指定一或多个zone


## 04-1-many-eureka 多个eureka服务互相注册(同第三章)
先添加C:\Windows\System32\drivers\etc\hosts文件内容如下：  
127.0.0.1      peer1  
127.0.0.1      peer2  
127.0.0.1      peer3  
然后运行  
mvn clean  
mvn package  
runpeer1.bat  
runpeer2.bat  
访问： http://localhost:1111/
访问： http://localhost:1112/

 ## 04-2-hello-services-withsleep 服务提供者
与第三章相比，修改hello()方法，随机睡眠0~3秒模拟长时间操作
运行  
mvn clean  
mvn package  
run8881.bat
run8882.bat
run8883.bat
访问： http://localhost:8881/hello
访问： http://localhost:8882/hello
访问： http://localhost:8883/hello

## 04-3-ribbon-consumer-hystrix服务消费者
相比与第三章，如下改动：
1.在pom中添加 spring-cloud-starter-hystrix 依赖  
2.ComsumerApplication类上添加 @EnableCircuitBreaker  
  (或添加@SpringCloudApplication, 它等于@EnableCircuitBreaker + @SpringBootApplication +@EnableDiscoverClient)  
3.新增HelloService.java,在helloService方法上添加@HystrixCommand, 并改造ConsumerController注入HelloService，详见源码  
4.HelloService里添加时间logger输出到控制台
运行  
mvn clean  
mvn package  
mvn_springbootrun.bat 
访问：http://localhost:9000/ribbon-consumer
运行结果:
1.如果断开8881或8882，会返回error
2.如果超时2秒，也会返回error
