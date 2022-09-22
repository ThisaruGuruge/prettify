# Overview

This package provides an API to prettify `json` values, which is a native type in the Ballerina language.

## Usage
This package has a single API: `prettify`. It takes a `json` value as the first argument. An optional `indentation` parameter can be provided if a custom number of spaces are needed as the indentation. Otherwise, the default 4 spaces will be used as the indentation.

Following are the example usages.

### Prettify with default indentation

```ballerina
import ballerina/io;
import thisarug/prettify;

public function main() {
    json value = {
        name: "Walter White",
        age: 51,
        address: {
            number: 308,
            street: "Negra Arroyo Lane",
            city: "Albuquerque"
        }
    };
    string prettified = prettify:prettify(value);
    io:println(prettified);
}
```

This will print the following:

```shell
{
    "name": "Walter White",
    "age": 51,
    "address": {
        "number": 308,
        "street": "Negra Arroyo Lane",
        "city": "Albuquerque"
    }
}
```

### Prettify with custom indentation

```ballerina
import ballerina/io;
import thisarug/prettify;

public function main() {
    json value = {
        name: "Walter White",
        age: 51,
        address: {
            number: 308,
            street: "Negra Arroyo Lane",
            city: "Albuquerque"
        }
    };
    string prettified = prettify:prettify(value, 2);
    io:println(prettified);
}
```

This will print the following:

```shell
{
  "name": "Walter White",
  "age": 51,
  "address": {
    "number": 308,
    "street": "Negra Arroyo Lane",
    "city": "Albuquerque"
  }
}
```
