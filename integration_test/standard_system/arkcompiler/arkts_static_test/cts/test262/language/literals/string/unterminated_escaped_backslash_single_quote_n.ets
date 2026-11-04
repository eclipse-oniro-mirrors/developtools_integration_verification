/* Licensed under the Apache License, Version 2.0 */
/*---
desc: A backslash followed by a quote is not a complete single quoted string
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0265: Newline is not allowed in strings
---*/
function main(): void {
    '\\\'
}
