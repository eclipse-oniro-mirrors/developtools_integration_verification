/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword typeof cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token '='.
    Syntax error ESY0227: Unexpected token '1'.
---*/
function main(): void {
    typeof = 1;
}
