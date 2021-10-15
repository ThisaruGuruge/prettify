function getIndentation(int indentation) returns string {
    string result = "";
    foreach int i in 1...indentation {
        result += " ";
    }
    return result;
}

function getIndentationForLevel(string indentation, int level) returns string {
    string result = "";
    foreach int i in 1...level {
        result += indentation;
    }
    return result;
}

function getInitialIndentation(string indentation, int level, boolean isMapField) returns string {
    if isMapField {
        return " ";
    }
    return getIndentationForLevel(indentation, level);
}
