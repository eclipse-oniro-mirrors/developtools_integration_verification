/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword while cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0230: Expected '(', got '='.
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0230: Expected ')', got 'number literal'.
    Syntax error ESY0301: Missing condition in while statement
---*/
function main(): void {
    while = 1;
}
