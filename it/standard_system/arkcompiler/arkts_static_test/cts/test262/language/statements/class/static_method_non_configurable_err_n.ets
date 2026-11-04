/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Failure to define property for static method
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token 'prototype'.",
    "Semantic error ESE0343: Indexed signatures are not allowed. Use arrays instead!",
    "Syntax error ESY0227: Unexpected token ']'.",
    "Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.",
]
---*/

// Conversion notes: P 源；static 计算名 ['prototype']（ESE0343）
class C {
    static ['prototype'](): void {
    }
}

