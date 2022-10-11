cd 04-1-many-eureka
call mvn clean package
start "eureka" runLocalhostOnly.bat
cd..

cd 04-2-hello-services-withsleep
call mvn clean package
start "service8881" runLocalhost8881.bat
start "service8882" runLocalhost8882.bat
cd..

cd 04-3-ribbon-consumer-hystrix
call mvn clean package
start "ribbonHystrix9000" run9000.bat
start "ribbonHystrix9002" run9002.bat
cd..
 
cd 04-4-turbine
start "turbine" mvn_springbootrun.bat
cd..
 
cd 04-5-hystrix-dashboard
start "HystrixDashBoard" mvn_springbootrun.bat
cd.. 

for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set SoftWareRoot=%%a %%b)
start "" % SoftWareRoot % "http://localhost:9000/ribbon-consumer"
start "" % SoftWareRoot % "http://localhost:9002/ribbon-consumer-2"
start "" % SoftWareRoot % "http://localhost:2001/hystrix/monitor?stream=http://localhost:8989/turbine.stream"