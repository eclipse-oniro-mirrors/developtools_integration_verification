/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It's a SyntaxError if an array literal evaluated on ClassHeritage uses a private name. (class expression)
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0230: Expected '{', got '('.
    Syntax error ESY0122: Identifier expected.
    Semantic error ESE0176: The super type of 'C' class is not extensible.
    Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.
    Syntax error ESY0227: Unexpected token '=>'.
    Syntax error ESY0227: Unexpected token '{'.
    Syntax error ESY0227: Unexpected token ')'.
---*/

class C extends ((): void => {}) {
}

