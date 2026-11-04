/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'
    Semantic error ESE0143: Unresolved reference yield
---*/

// Conversion notes: 源 `0, class { m(x = yield) {} }` → 声明；默认参数含 yield 测早期错误
class C {
    m(x: number = yield): void {
    }
}

