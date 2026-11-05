/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword instanceof cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'instanceof'.
---*/
function main(): void {
    instanceof = 1;
}
