import ballerina/file;
import ballerina/io;

isolated function getStringContentFromFile(string fileName) returns string|error {
    string path = check file:joinPath("tests", "resources", "expected_results", fileName);
    return io:fileReadString(path);
}

isolated function getJsonContentFromFile(string fileName) returns json|error {
    string path = check file:joinPath("tests", "resources", "input_files", fileName);
    return io:fileReadJson(path);
}
