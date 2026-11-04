/* Licensed under the Apache License, Version 2.0 */
/*---
desc: A line terminator cannot occur inside a single quoted string
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0265: Newline is not allowed in strings
    Syntax error ESY0265: Newline is not allowed in strings
    Syntax error ESY0227: Unexpected token ''.
---*/
function main(): void {
    '
    '
}
