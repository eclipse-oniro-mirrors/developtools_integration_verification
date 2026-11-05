/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword if cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0230: Expected '(', got '='.
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0230: Expected ')', got 'number literal'.
---*/
function main(): void {
    if = 1;
}
