/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Checking if execution of abstract=1 succeeds
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'abstract' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'abstract'.
---*/
function main(): void {
    let abstract = 1;
}
