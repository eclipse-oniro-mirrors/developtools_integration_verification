/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword continue cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0165: Illegal continue statement.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Syntax error ESY0227: Unexpected token '1'.
---*/
function main(): void {
    continue = 1;
}
