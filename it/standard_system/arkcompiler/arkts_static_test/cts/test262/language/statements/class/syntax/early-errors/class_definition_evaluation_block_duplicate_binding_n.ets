/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0040: Illegal start of CLASS expression."]
---*/

{
    class A {}
    class A {}
}

