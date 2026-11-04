/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/

// Conversion notes: `\u` 转义标识符字面文本（ESY0271）
let \u006c\u0065\u0074: int = 1;

