/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Checking if execution of native=1 succeeds
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'native' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'native'.
---*/
function main(): void {
    let native = 1;
}
