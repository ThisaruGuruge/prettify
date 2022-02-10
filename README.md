[![codecov](https://codecov.io/gh/ThisaruGuruge/prettify/branch/main/graph/badge.svg?token=J2OKNF0TCB)](https://codecov.io/gh/ThisaruGuruge/prettify)

# Prettify JSON

This is a library for Ballerina, to prettify JSON values. Since the Ballerina language supports `json` as a built-in
type, this can be used to print JSON values easily.

## Overview

This module provides an API to prettify `json` values, which are a native type in the Ballerina language.

### Usage
This module has a single API: `prettify`. It takes a `json` value as the first argument. An optional `indentation` parameter can be provided if a custom number of spaces are needed as the indentation. Otherwise, the default 4 spaces will be used as the indentation.

Following are the example usages.

#### Prettify with default indentation

```ballerina
import ballerina/io;
import ThisaruGuruge/prettify;

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

#### Prettify with custom indentation

```ballerina
import ballerina/io;
import ThisaruGuruge/prettify;

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
