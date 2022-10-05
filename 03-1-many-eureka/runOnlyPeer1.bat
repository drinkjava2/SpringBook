cd target
java -jar eureka-server-1.0.0.jar --spring.application.name=eureka-server --server.port=1111 --eureka.instance.hostname=peer1 --eureka.client.serviceUrl.defaultZone=http://peer1:1111/eureka/