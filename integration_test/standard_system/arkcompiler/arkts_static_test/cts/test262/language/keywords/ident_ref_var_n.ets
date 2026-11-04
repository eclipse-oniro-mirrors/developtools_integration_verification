/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword var cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.
    Syntax error ESY0224: Identifier expected, got '='.
    Syntax error ESY0227: Unexpected token '1'.
    Syntax error ESY0105: Variable must be initialized or it's type must be declared.
---*/
function main(): void {
    var = 1;
}
