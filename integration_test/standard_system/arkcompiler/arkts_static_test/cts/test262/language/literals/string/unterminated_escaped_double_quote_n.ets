/* Licensed under the Apache License, Version 2.0 */
/*---
desc: An escaped double quote cannot terminate this malformed string
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0265: Newline is not allowed in strings
---*/
function main(): void {
    "\"
}
