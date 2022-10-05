cd target
java -jar feign-consumer-0.0.1-SNAPSHOT.jar --spring.cloud.loadbalancer.retry.enabled=true hystrix.command.default.execution.isolation.thread.timeoutInMilliseconds=9000 --HELLO-SERVICE.ribbon.OkToRetryOnAllOperations=true --HELLO-SERVICE.ribbon.ReadTimeout=1500 --HELLO-SERVICE.ribbon.MaxAutoRetriesNextServer=2 --HELLO-SERVICE.ribbon.MaxAutoRetries=1
