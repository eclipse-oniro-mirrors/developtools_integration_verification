/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'static' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'static'.
---*/

// Conversion notes: class-expr→声明；类名保留字 `static` 测早期错误
let static: int = 1;
}

