cd 08-1-many-eureka
call mvn clean package
start "eureka" runLocalhostOnly.bat
cd..

cd 08-2-hello-services-withsleep
call mvn clean package
start "service8881" runLocalhost8881.bat
start "service8882" runLocalhost8882.bat
cd..

cd 08-3-feign-consumer
call mvn clean package
start "feign" runWithRetry.bat
cd..

cd 08-4-api-gateway
call mvn clean package
start "zuul" run.bat
cd ..

for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set SoftWareRoot=%%a %%b)
start "" % SoftWareRoot % "http://localhost:5555/api-a-url//hello"
start "" % SoftWareRoot % "http://localhost:5555/api/a/hello"

 