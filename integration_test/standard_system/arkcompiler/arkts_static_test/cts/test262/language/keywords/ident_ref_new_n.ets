/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword new cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0025: Invalid left-hand side of assignment expression
    Syntax error ESY0138: Invalid Type.
    Syntax error ESY0072: Invalid left-hand side in assignment expression.
---*/
function main(): void {
    new = 1;
}
