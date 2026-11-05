/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The "Await" parsing context does not apply to the block's statement list
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0001: Return type of async function must be 'Promise'.
    Syntax error ESY0040: Illegal start of CLASS expression.
---*/

// Conversion notes: static 块内 `await 0`（await 硬关键字 ESY0316）
async function f(): void {
    class C {
        static {
            await 0;
        }
    }
}

