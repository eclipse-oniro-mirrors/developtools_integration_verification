/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/

// Conversion notes: `\u` 转义标识符字面文本（ESY0271）
let \u0073\u0074\u0061\u0074\u0069\u0063: int = 1;

