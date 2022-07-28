# SpringCloudBook
本工程为《Spring Cloud实战》一书的配套示例代码

# 目录说明

## 01-spring-boot-hello springboot入门
运行
mvn_springbootrun.bat 

## 02-1-eureka-server 服务注册
运行 mvn_springbootrun.bat

## 02-2-hello-services 服务提供
运行 mvn_springbootrun.bat

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
 
## 03-2-hello-services 服务提供者
运行  
mvn clean  
mvn package  
run8881.bat
run8882.bat
run8883.bat

## 03-3-ribbon-consumer 服务消费者
运行  
mvn clean  
mvn package  
mvn_springbootrun.bat 


