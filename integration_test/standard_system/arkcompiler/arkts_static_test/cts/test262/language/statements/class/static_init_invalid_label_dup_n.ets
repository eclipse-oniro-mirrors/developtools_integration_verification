/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Block cannot declare duplicate labels
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0038: Label must be followed by a loop statement."]
---*/

// Conversion notes: static 块内重复标签（ArkTS 标签支持未知，capture 实测）
class C {
    static {
        x: x: 0;
    }
}

