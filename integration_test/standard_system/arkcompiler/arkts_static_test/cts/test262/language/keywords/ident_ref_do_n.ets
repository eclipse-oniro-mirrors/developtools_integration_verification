/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword do cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0227: Unexpected token '1'.
    Syntax error ESY0228: Unexpected token, expected 'while'.
    Syntax error ESY0228: Unexpected token, expected '('.
    Syntax error ESY0227: Unexpected token '}'.
    Syntax error ESY0230: Expected ')', got 'end of stream'.
    Syntax error ESY0230: Expected '}', got 'end of stream'.
    Syntax error ESY0301: Missing condition in do while statement
---*/
function main(): void {
    do = 1;
}
