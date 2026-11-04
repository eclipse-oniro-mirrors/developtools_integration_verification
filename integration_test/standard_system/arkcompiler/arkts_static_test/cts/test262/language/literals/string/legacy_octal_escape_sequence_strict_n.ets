/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Legacy octal escape sequence is rejected in strict code
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0258: Invalid character escape sequence.
---*/
function main(): void {
    '\1';
}
