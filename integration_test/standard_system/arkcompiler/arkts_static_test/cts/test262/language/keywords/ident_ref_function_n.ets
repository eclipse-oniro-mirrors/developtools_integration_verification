/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword function cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0147: Unexpected token, expected function identifier.
    Syntax error ESY0228: Unexpected token, expected '('.
    Syntax error ESY0230: Expected '{', got ';'.
    Syntax error ESY0194: Parameter declaration should have an explicit type annotation.
    Syntax error ESY0229: Unexpected token, expected ',' or ')'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
---*/
function main(): void {
    function = 1;
}
