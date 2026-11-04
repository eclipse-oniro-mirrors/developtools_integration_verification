/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Block cannot declare duplicate lexically-scoped bindings
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'x' has already been declared."]
---*/

// Conversion notes: static 块内重复 let 绑定（ESE0351 重复声明）
class C {
    static {
        let x: number = 0;
        let x: number = 0;
    }
}

