/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It's a syntax error if a FunctionRestParameter is followed by a trailing comma (class declaration async method)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0067: Rest parameter must be the last formal parameter."]
---*/

class C {
    async method(...a: number[],): Promise<void> {
    }
}

