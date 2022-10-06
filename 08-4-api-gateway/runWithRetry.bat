cd target
java -jar api-gateway-1.0.0.jar^
     --spring.cloud.loadbalancer.retry.enabled=true^
     --hystrix.command.default.execution.isolation.thread.timeoutInMilliseconds=9000^
     --HELLO-SERVICE.ribbon.OkToRetryOnAllOperations=true^
     --HELLO-SERVICE.ribbon.ReadTimeout=1500^
     --HELLO-SERVICE.ribbon.MaxAutoRetriesNextServer=2^
     --HELLO-SERVICE.ribbon.MaxAutoRetries=1
