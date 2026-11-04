/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Block cannot reference an undefined `break` target
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference y"]
---*/

// Conversion notes: static 块内 break 未定义标签 y
class C {
    static {
        x: while (false) {
            break y;
        }
    }
}

