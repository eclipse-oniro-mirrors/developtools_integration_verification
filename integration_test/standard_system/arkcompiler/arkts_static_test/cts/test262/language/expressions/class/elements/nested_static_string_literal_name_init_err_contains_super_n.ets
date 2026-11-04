/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Syntax error if `super()` used in class field (static string literal ClassElementName)
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'x'.
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.
    Syntax error ESY0227: Unexpected token '=>'.
    Syntax error ESY0295: number is a predefined type, cannot be used as an identifier
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0227: Unexpected token 'super'.
---*/

class C {
    public static 'x': () => number = (): number => super();
}

