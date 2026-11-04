/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'let' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'let'.
---*/

// Conversion notes: class-expr→声明（ESE0020）；类名保留字 `let` 测早期错误
let let: int = 1;
}

