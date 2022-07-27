# SpringCloudBook
本工程为《Spring Cloud实战》一书的配套示例代码

# 目录说明

## 01-spring-boot-hello
springboot入门 

## 02-1-eureka-server 和  02-2-hello-services
eureka服务和注册客户端

## 03-1-many-eureka 多个eureka服务互相注
先改hosts文件如下：  
127.0.0.1      peer1  
127.0.0.1      peer2  
127.0.0.1      peer3  
然后运行  
mvn clean  
mvn package  
runpeer1.bat  
runpeer2.bat  
runpeer3.bat  
 


