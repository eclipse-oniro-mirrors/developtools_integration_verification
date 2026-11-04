/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0230: Expected '{', got '('.
    Syntax error ESY0122: Identifier expected.
    Semantic error ESE0176: The super type of 'C' class is not extensible.
    Syntax error ESY0227: Unexpected token 'async'.
    Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.
    Syntax error ESY0227: Unexpected token '=>'.
    Syntax error ESY0227: Unexpected token '{'.
    Syntax error ESY0227: Unexpected token ')'.
---*/

// Conversion notes: P 源；extends async 箭头函数编译期拒
class C extends (async (): Promise<void> => {}) {
}

