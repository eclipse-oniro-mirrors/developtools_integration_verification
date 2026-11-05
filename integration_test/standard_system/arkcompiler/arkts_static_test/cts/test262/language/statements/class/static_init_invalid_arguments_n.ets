/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Block cannot use `arguments` as an identifier
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0040: Illegal start of CLASS expression.",
    "Semantic error ESE0343: Indexed signatures are not allowed. Use arrays instead!",
    "Syntax error ESY0227: Unexpected token ']'.",
    "Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.",
]
---*/

// Conversion notes: 源 `(class { [argument\u0073]() {} })` 嵌套 class 表达式 → 声明（ESE0020）；`\u` 字面文本 + 计算名保留
class C {
    static {
        class D {
            [argument\u0073](): void {
            }
        }
    }
}

