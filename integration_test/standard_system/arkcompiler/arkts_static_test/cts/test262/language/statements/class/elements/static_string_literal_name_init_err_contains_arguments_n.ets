/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Syntax error if `arguments` used in class field (static string literal ClassElementName)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token 'x'.",
    "Syntax error ESY0227: Unexpected token ':'.",
    "Syntax error ESY0295: number is a predefined type, cannot be used as an identifier",
    "Syntax error ESY0227: Unexpected token '='.",
    "Syntax error ESY0121: Field type annotation expected.",
]
---*/

class C {
    public static 'x': number = arguments;
}

