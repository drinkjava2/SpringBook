# ====01 spring-boot 入门===  
## 01-spring-boot-hello springboot入门  
运行  
mvn_springbootrun.bat  
访问： http://localhost:8881/hello  
  
# ====02 eureka服务注册和Hello Services ===  
## 02-1-eureka-server 服务注册  
运行 mvn_springbootrun.bat  
访问： http://localhost:1111/  
  
## 02-2-hello-services  
运行 mvn_springbootrun.bat  
访问： http://localhost:8881/hello  
  
# ====03 多个eureka服务互相注册及Ribbon消费者 ===  
## 03-1-many-eureka 多个eureka服务互相注册  
先添加C:\Windows\System32\drivers\etc\hosts文件内容如下：  
127.0.0.1  peer1  
127.0.0.1  peer2  
127.0.0.1  peer3  
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
  
# ====04 hystrix入门 ===  
## 04-1-many-eureka 多个eureka服务互相注册(同第三章)  
先添加C:\Windows\System32\drivers\etc\hosts文件内容如下：  
127.0.0.1  peer1  
127.0.0.1  peer2  
127.0.0.1  peer3  
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
run9000.bat
run9002.bat
访问：
http://localhost:9000/ribbon-consumer  
http://localhost:9000/ribbon-consumer-2   (对应commandKey=helloKey2)  
http://localhost:9002/ribbon-consumer
http://localhost:9002/ribbon-consumer-2  (对应commandKey=helloKey2)   
运行结果:  
1.如果断开8881或8882，会返回error  
2.如果超时2秒，也会返回error  
  
## 04-4-tubine 集群监控(可选)  
运行：mvn_springbootrun.bat  
使用：要和hystrix-dashboard配合使用，见下面  
  
## 04-5-hystrix-dashboard HyStrix监控仪表盘  
1）为主类添加@EnableHystrixDashboard即可启用Hystrix Dashboard  
2）在被监控的Ribbon中要生成一个/hystrix.stream流以供监控，在ribbon项目中添加hystrix和actuator依赖，并在主类中存在@EnableCircuitBreaker  
运行 mvn_springbootrun.bat  
访问：
1) http://localhost:2000/hystrix  
2) 然后在url栏输入http://localhost:9000/hystrix.stream，点击monitor Stream按扭, 可以单独监控一个端口。  
   或直接输入：  
   http://localhost:2001/hystrix/monitor?stream=http%3A%2F%2Flocalhost%3A9000%2Fhystrix.stream  
3) 访问http://localhost:9000/ribbon-consumer  
即可看到监控图表，线条表示访问量，实心圆大小表示流量，健康度由绿、黄、橙、红色来表示  
或与turbine配合使用：上面的url输入: http://localhost:8989/turbine.stream即可，或直接输入：  
http://localhost:2001/hystrix/monitor?stream=http%3A%2F%2Flocalhost%3A8989%2Fturbine.stream  

# ====05 rabbitmq安装和测试 ===    
## 05-1-rabbitmq-hello  
安装RabbitMQ:  
1.下载并安装Erlang, http://www.erlang.org/downloads (otp_win64_25.1.exe)  
2.下载并安装RabbitMQ,  http://www.rabbitmq.com/download (rabbitmq-server-3.11.0.exe)  
   运行rabbitmq-plugins enable rabbitmq_management, 并停止和重启services  
   打开 http://localhost:15672, 初始密码guest/guest,改成guest123  
   添加用户springcloud/123456，并更新它的vhost权限为/  
运行：   
1.mvn_springbootrun.bat， 可以看到在admin page可以看到connection里出现一个springcloud的连接  
2.运行maven_test.bat，可看到server命令行下打印出 REceiver: xxx xxx  

# ====06 RabbitMQ + Turbine + Hystrix ===    
hystrix先发送到rabbitMQ, 再由turbine收集消息出报表  
06-1-many-eureka 同04-1，无修改  
06-2-hello-services-withsleep 同04-2，无修改  
06-3-ribbon-consumer-hystrix-mq 在04-3基础上，仅在pom中添加了spring-cloud-netflix-hystrix-amqp依赖  
06-4-turbine-amqp 集成turbine和RabbitMQ   
06-5-hystrix-dashboard 同04-5，无修改  
运行：依次1,2,3,4,5启动  
访问：
http://localhost:2001/hystrix/monitor?stream=http%3A%2F%2Flocalhost%3A8989%2Fturbine.stream  
http://localhost:9000/ribbon-consumer  
http://localhost:9000/ribbon-consumer-2  
http://localhost:9002/ribbon-consumer
http://localhost:9002/ribbon-consumer-2  
 
# ====07 用Feign来代替Ribbon和Hystrix, 声明式注入替换restTemplate模板 ===    
07-1-many-eureka 同04-1，无修改  
07-2-hello-services-withsleep 添加User, Hello456Service等  
07-3-feign-consumer  
运行：  
07-1下的runLocalhostOnly.bat  
07-2下的runLocalhost8881.bat
07-2下的runLocalhost8882.bat
07-3下的run.bat或runWithRetry.bat
访问：
http://localhost:9000/feign-consumer  
http://127.0.0.1:9000/feign-consumer2  
http://127.0.0.1:9000/feign-consumer3  
要点：   
1)在Feign应用的service或Service接口上用@FeignClient(name="HELLO-SERVICE")就可在其它地方注入spring自动生成的实例  
2)Service的继承，Service 提供者应用里不需要再添加 @RequestMapping(value = "/hello")，因为接口基类已有了  
   @RestController  
    public class RefactorHello456Controller implements Hello456Service   
3)Feign 消费者应用里也不需要添加 @RequestMapping(value = "/hello")，因为接口基类已有了  
   @FeignClient(value = "HELLO-SERVICE")  
   public interface RefactorHello456Service extends com.didispace.service.Hello456Service  
4)如果运行runWithRetry.bat，将开启重试演示，注意DOS批处理一行写不下连行符是上尖号  
关于Ribbon/Feign/Hystrix 的超时、重试问题总结，可以参考[这个](https://juejin.cn/post/6893079768997363719)    
ribbon 的默认 ConnectTimeout 和 ReadTimeout 都是 1000 ms  
如果请求时间超过 ribbon 的超时配置，会触发重试；  
在配置 fallback 的情况下，如果请求的时间，从第一个请求开始算起，超出了ribbon的总超时限制（即多个Service的重试时间汇总），或者 hystrix 的超时限制，那么就会熔断  

# ====08 zuul API gateway 网关 ===    
08-1-many-eureka 同04-1，无修改  
08-2-hello-services-withsleep 同07  
08-3-feign-consumer  同07 
08-4-api-gateway
运行：  
08-1下的runLocalhostOnly.bat  
08-2下的runLocalhost8881.bat和runLocalhost8882.bat  
08-3下的runWithRetry.bat  
08-4下的mvn_springbootrun.bat  
访问（各种路由见配置)：
http://localhost:5555/api-a-url//hello  
http://localhost:5555/api/a/hello  


   