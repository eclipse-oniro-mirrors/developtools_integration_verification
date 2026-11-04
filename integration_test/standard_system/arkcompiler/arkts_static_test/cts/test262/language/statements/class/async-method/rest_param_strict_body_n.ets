/* Licensed under the Apache License, Version 2.0 */
/*---
desc: |
    RestParameter and Use Strict Directive are not allowed to coexist for the same function. (class declaration
    async method)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0199: Illegal 'use strict' directive in function with non-simple parameter list."]
---*/

class C {
    async method(a: number, ...rest: number[]): Promise<void> {
        'use strict';
    }
}

