/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/

// Conversion notes: `\u0061` 转义 await 字面文本（ESY0271）；module 语义
let \u0061\u0077\u0061\u0069\u0074: int = 1;

