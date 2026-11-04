/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Checking if execution of final=1 succeeds
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'final' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'final'.
---*/
function main(): void {
    let final = 1;
}
