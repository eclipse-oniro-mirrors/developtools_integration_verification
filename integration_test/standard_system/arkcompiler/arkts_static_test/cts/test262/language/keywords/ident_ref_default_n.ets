/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword default cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'default'.
---*/
function main(): void {
    default = 1;
}
