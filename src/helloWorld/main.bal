import ballerina/http;
import ballerina/log;
// import ballerina/docker;

// @docker:Expose {}
// listener http:Listener helloWorldEP = new(9090);
// @docker:Config {
//     name: "helloworld",
//     tag: "v1.0"
// }
@http:ServiceConfig {
    basePath: "/helloWorld"
}
service helloWorld on new http:Listener(9090) {
    resource function sayHello(http:Caller outboundEP, http:Request request) {
        http:Response response = new;
        response.setTextPayload("Hello World from Docker ! \n");
        var responseResult = outboundEP->respond(response);
        if (responseResult is error) {
            error err = responseResult;
            log:printError("Error sending response", err);
        }
    }
}
