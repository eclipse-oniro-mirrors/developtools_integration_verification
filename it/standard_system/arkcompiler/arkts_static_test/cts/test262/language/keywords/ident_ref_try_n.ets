/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword try cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0039: A try statement should contain either finally clause or at least one catch clause.
    Syntax error ESY0230: Expected '{', got '='.
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0227: Unexpected token '1'.
    Syntax error ESY0230: Expected '}', got 'end of stream'.
---*/
function main(): void {
    try = 1;
}
