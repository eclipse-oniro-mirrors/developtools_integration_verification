/* Licensed under the Apache License, Version 2.0 */
/*---
desc: A Unicode escape must be followed by four hexadecimal digits in a double quoted string
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0091: Invalid Unicode escape.
    Syntax error ESY0265: Newline is not allowed in strings
---*/
function main(): void {
    '\u'
}
