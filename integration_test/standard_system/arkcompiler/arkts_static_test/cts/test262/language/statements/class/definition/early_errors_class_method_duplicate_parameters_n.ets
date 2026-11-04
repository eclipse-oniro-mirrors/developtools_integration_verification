/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Formal parameters may not contain duplicates
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'a' has already been declared."]
---*/

class Foo {
    foo(a: number, a: number): void {
    }
}

