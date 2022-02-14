# Prettifies a `json` value to print it.
#
# + value - the `json` value to be prettified
# + indentation - The number of spaces for an indentation
# + return - The prettified `json` as a string
public function prettify(json value, int indentation = 4) returns string {
    string indent = getIndentation(indentation);
    return prettifyJson(value, indent, 0);
}
