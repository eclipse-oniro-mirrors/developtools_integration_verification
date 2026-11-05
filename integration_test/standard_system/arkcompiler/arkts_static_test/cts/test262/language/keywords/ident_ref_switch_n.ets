/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword switch cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0230: Expected '(', got '='.
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0230: Expected ')', got 'number literal'.
    Syntax error ESY0230: Expected ':', got 'number literal'.
    Syntax error ESY0230: Expected '{', got 'number literal'.
    Syntax error ESY0231: Unexpected token 'number literal', expected 'case' or 'default'.
    Syntax error ESY0230: Expected '}', got 'end of stream'.
---*/
function main(): void {
    switch = 1;
}
