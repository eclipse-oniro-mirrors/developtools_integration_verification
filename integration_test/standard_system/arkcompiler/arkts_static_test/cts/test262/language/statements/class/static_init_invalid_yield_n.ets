/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The "Yield" parsing context does not apply to the block's statement list
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0314: Generator functions are not supported, please use async/await mechanism for multitasking
    Syntax error ESY0040: Illegal start of CLASS expression.
---*/

// Conversion notes: generator（ESY0227）+ static 块内 yield
function * g(): void {
    class C {
        static {
            yield;
        }
    }
}

