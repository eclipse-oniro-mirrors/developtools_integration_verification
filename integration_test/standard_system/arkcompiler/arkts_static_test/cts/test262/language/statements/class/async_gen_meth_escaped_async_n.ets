/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0271: Escape sequences are not allowed in keyword.",
    "Syntax error ESY0121: Field type annotation expected.",
    "Syntax error ESY0227: Unexpected token '*'.",
]
---*/

// Conversion notes: `\u0061sync` 转义关键字字面文本（ESY0271）
class C {
    \u0061sync* m(){}
}

