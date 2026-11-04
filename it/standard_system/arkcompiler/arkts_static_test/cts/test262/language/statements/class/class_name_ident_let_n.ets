/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0316: Hard keyword 'let' cannot be used as identifier",
    "Syntax error ESY0224: Identifier expected, got 'let'.",
]
---*/

// Conversion notes: 保留字 `let` 不能作为标识符（ESY0316）
let let: int = 1;

