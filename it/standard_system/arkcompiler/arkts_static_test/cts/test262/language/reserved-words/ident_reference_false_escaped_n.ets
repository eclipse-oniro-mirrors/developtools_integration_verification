/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Escaped reserved word false cannot be used as an identifier reference
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Semantic error ESE0143: Unresolved reference false
---*/
function main(): void {
    f\u0061lse = 0;
}
