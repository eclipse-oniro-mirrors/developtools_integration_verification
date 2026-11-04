/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Class definition should error if evaluation of static ClassElementName errors
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0343: Indexed signatures are not allowed. Use arrays instead!",
    "Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.",
    "Syntax error ESY0227: Unexpected token ']'.",
    "Syntax error ESY0227: Unexpected token ':'.",
    "Syntax error ESY0295: number is a predefined type, cannot be used as an identifier",
    "Syntax error ESY0227: Unexpected token '='.",
    "Syntax error ESY0227: Unexpected token '0'.",
]
---*/

// Conversion notes: P 源；static 计算属性名不可表达（ESE0343）
function f(): number {
    throw new Error();
}
class C {
    public static [f()]: number = 0;
}

