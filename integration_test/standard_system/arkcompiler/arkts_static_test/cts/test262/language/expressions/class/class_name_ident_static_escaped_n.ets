/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/

// Conversion notes: class-expr→声明；`\u` 转义标识符写字面文本（ESY0271）
let st\u0061tic: int = 1;

