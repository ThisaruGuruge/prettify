import ballerina/io;
import ballerina/test;

@test:BeforeSuite
function setupTests() {
    printLine();
    io:println("*   Prettify Json Tests   *");
    printLine();
}

@test:Config {
    groups: ["string"]
}
function testStringValue() returns error? {
    json value = "Sam";
    string actual = prettify(value);
    string expected = check getContentFromFile("string_value.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["int"]
}
function testIntValue() returns error? {
    json value = 515;
    string actual = prettify(value);
    string expected = check getContentFromFile("int_value.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["boolean"]
}
function testBooleanValue() returns error? {
    json value = false;
    string actual = prettify(value);
    string expected = check getContentFromFile("boolean_value.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["array"]
}
function testStringArray() returns error? {
    json value = ["sam", "bam", "tan"];
    string actual = prettify(value);
    string expected = check getContentFromFile("string_array.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["array"]
}
function testEmptyArray() returns error? {
    json value = [];
    string actual = prettify(value);
    string expected = check getContentFromFile("empty_array.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["map"]
}
function testEmptyMap() returns error? {
    json value = {};
    string actual = prettify(value);
    string expected = check getContentFromFile("empty_map.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["map"]
}
function testArrayOfEmptyMaps() returns error? {
    json value = [
        {},
        {},
        {}
    ];
    string actual = prettify(value);
    string expected = check getContentFromFile("array_of_empty_maps.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["map"]
}
function testMapWithStringField() returns error? {
    json value = {
        name: "Walter White"
    };
    string actual = prettify(value);
    string expected = check getContentFromFile("map_with_string_field.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["map"]
}
function testMapWithMultipleStringFields() returns error? {
    json value = {
        name: "Walter White",
        subject: "Chemistry",
        city: "Albequerque"
    };
    string actual = prettify(value);
    string expected = check getContentFromFile("map_with_multiple_string_fields.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["map"]
}
function testMap() returns error? {
    json value = {
        person: {
            name: "Walter White",
            age: 51,
            address: {
                number: 308,
                street: "Negra Arroyo Lane",
                city: "Albequerque"
            }
        }
    };
    string actual = prettify(value);
    string expected = check getContentFromFile("map.json");
    test:assertEquals(actual, expected);
}

@test:Config {
    groups: ["map"]
}
function testArrayOfMap() returns error? {
    json value = [
        {
            name: "Walter White",
            age: 51,
            address: {
                number: 308,
                street: "Negra Arroyo Lane",
                city: "Albequerque"
            }
        },
        {
            name: "Jesse Pinkman",
            age: 26,
            address: {
                number: 9809,
                street: "Margo Street",
                city: "Albequerque"
            }
        }
    ];
    string actual = prettify(value);
    string expected = check getContentFromFile("array_of_map.json");
    test:assertEquals(actual, expected);
}
