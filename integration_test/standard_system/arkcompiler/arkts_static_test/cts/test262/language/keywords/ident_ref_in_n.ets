/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword in cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'in'.
---*/
function main(): void {
    in = 1;
}
