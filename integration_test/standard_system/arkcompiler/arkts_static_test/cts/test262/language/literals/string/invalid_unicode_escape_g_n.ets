/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Unicode escape sequences require hexadecimal digits
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0091: Invalid Unicode escape.
---*/
function main(): void {
    '\u000G'
}
