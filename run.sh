docker container stop $(docker ps -a -q)
docker container prune -f

docker container run --rm -it -v $(pwd):/home/ballerina -u $(id -u):$(id -u) -e JAVA_OPTS="-Duser.home=/home/ballerina" choreoipaas/choreo-ballerina:latest ballerina build --skip-tests helloWorld
docker build -t helloworldobs -f src/helloWorld/docker/Dockerfile ${PWD}
docker run -dit --cpus=1 --name=hwo1 -p 9090:9090 helloworldobs:latest;

# Test with the following curl 
# curl --request POST http://127.0.0.1:9090/helloWorld/sayHello