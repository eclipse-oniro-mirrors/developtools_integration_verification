/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Block cannot declare a lexically-scoped binding and function-scoped binding with the same name.
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.
    Semantic error ESE0351: Variable 'x' has already been declared.
---*/

// Conversion notes: static 块内 let+var 同名（var 不支持 ESY0297）
class C {
    static {
        let x: number = 0;
        var x: number = 0;
    }
}

