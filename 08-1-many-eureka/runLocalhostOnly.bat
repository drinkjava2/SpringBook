cd target
java -jar eureka-server-1.0.0.jar^
     --spring.application.name=eureka-server^
     --server.port=1111^
     --eureka.instance.hostname=localhost^
     --eureka.client.serviceUrl.defaultZone=http://localhost:1111/eureka/^
     --eureka.client.register-with-eureka=false^
     --eureka.client.fetch-registry=false^
     --logging.file=eureka-server.log