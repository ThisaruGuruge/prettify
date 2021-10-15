public function prettify(json value, int indentation = 4) returns string {
    string indent = getIndentation(indentation);
    return prettifyJson(value, indent, 0);
}

function prettifyJson(json value, string indentation, int level, boolean isMapField = false) returns string {
    if value == () {
        return "";
    } else if value is map<json> {
        return prettifyJsonMap(value, indentation, level, isMapField);
    } else if value is json[] {
        return prettifyJsonArray(value, indentation, level, isMapField);
    } else {
        return prettifyJsonField(value, indentation, level, isMapField);
    }
}

function prettifyJsonMap(map<json> value, string indentation, int level, boolean isMapField) returns string {
    string initialIndentation = getInitialIndentation(indentation, level, isMapField);
    string result = string`${initialIndentation}{`;
    boolean isEmptyMap = value.keys().length() == 0;
    if !isEmptyMap {
        result += "\n";
    }

    int fieldLevel = level + 1;
    string fieldIndentation = getIndentationForLevel(indentation, fieldLevel);
    int length = value.length();
    int i = 1;
    foreach string key in value.keys() {
        string fieldValue = prettifyJson(value.get(key), indentation, fieldLevel, true);
        string line = string`${fieldIndentation}"${key}":${fieldValue}`;
        result += line;
        if i != length {
            result += ",";
        }
        result += "\n";
        i += 1;
    }

    if !isEmptyMap {
        result += getIndentationForLevel(indentation, level);
    }
    result += "}";
    return result;
}


function prettifyJsonArray(json[] array, string indentation, int level, boolean isMapField) returns string {
    string initialIndentation = getInitialIndentation(indentation, level, isMapField);
    string result = string`${initialIndentation}[`;

    boolean isEmptyArray = array.length() == 0;
    if !isEmptyArray {
        result += "\n";
    }

    int elementLevel = level + 1;
    string elementIndentation = getIndentationForLevel(indentation, elementLevel);

    string[] elements = array.map(value => prettifyJson(value, indentation, elementLevel));
    string separator = ",\n";
    result += 'string:join(separator, ...elements);

    if !isEmptyArray {
        result += "\n" + initialIndentation;
    }
    result += "]";
    return result;
}

function prettifyJsonField(json value, string indentation, int level, boolean isMapField) returns string {
    string initialIndentation = getInitialIndentation(indentation, level, isMapField);
    string result = initialIndentation;
    result += value.toJsonString();
    return result;
}
