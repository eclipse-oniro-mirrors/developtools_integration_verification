/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword this cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0203: Cannot reference 'this' in this context.
    Semantic error ESE0025: Invalid left-hand side of assignment expression
    Syntax error ESY0072: Invalid left-hand side in assignment expression.
---*/
function main(): void {
    this = 1;
}
