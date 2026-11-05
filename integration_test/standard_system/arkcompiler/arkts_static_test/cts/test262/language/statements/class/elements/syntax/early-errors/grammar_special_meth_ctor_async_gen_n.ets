/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Async Generator Methods cannot be named "constructor" (class declaration)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token '*'.",
    "Syntax error ESY0140: Type annotation isn't allowed for constructor.",
]
---*/

class C {
    async * constructor(): Promise<void> {
    }
}

