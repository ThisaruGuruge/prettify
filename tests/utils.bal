import ballerina/file;
import ballerina/io;

isolated function getContentFromFile(string fileName) returns string|error {
    string path = check file:joinPath("tests", "resources", "expected_results", fileName);
    return io:fileReadString(path);
}

isolated function printLine() {
    io:println("***************************");
}
