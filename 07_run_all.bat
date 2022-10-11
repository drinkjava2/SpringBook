cd 07-1-many-eureka
call mvn clean package
start "eureka" runLocalhostOnly.bat
cd..

cd 07-2-hello-services-withsleep
call mvn clean package
start "service8881" runLocalhost8881.bat
start "service8882" runLocalhost8882.bat
cd..

cd 07-3-feign-consumer
call mvn clean package
start "feign" runWithRetry.bat
cd..

for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set SoftWareRoot=%%a %%b)
start "" % SoftWareRoot % "http://localhost:9000/feign-consumer"