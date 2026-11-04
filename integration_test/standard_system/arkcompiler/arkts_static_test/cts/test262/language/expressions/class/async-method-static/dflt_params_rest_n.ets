/* Licensed under the Apache License, Version 2.0 */
/*---
desc: RestParameter does not support an initializer (static class expression async method)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0192: Rest parameter cannot have the default value.",
    "Syntax error ESY0131: Identifier is needed here.",
]
---*/

class C {
    static async method(...x: number[] = []): Promise<void> {
    }
}

