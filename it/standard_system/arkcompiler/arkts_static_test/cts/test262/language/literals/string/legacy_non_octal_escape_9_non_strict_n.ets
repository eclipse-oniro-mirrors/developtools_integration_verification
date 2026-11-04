/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Non-octal decimal escape sequence 9 is rejected by ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0258: Invalid character escape sequence.
---*/
function main(): void {
    '\9';
}
