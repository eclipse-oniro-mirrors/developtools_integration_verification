/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment to the read-only global undefined property
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0203: Cannot reference 'this' in this context.
    Syntax error ESY0316: Hard keyword 'undefined' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'undefined'.
    Syntax error ESY0122: Identifier expected.
---*/
function main(): void {
    let global = this; global.undefined = 42;
}
