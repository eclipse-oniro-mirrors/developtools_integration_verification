/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token '*'.",
    "Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'",
    "Semantic error ESE0143: Unresolved reference yield",
]
---*/

// Conversion notes: generator 方法 + 默认参 yield（生成器族不可表达 ESY0227）
class C {
    *g(x: number = yield): void {
    }
}

