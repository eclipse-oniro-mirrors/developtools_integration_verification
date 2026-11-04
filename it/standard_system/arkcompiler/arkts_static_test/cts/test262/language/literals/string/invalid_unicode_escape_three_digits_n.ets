/* Licensed under the Apache License, Version 2.0 */
/*---
desc: A Unicode escape sequence cannot have three hexadecimal digits
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0091: Invalid Unicode escape.
    Syntax error ESY0265: Newline is not allowed in strings
---*/
function main(): void {
    '\u111'
}
