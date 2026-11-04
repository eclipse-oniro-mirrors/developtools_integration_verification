/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Escaped reserved word null cannot be used as an identifier reference
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Semantic error ESE0143: Unresolved reference null
---*/
function main(): void {
    nul\u006c = 0;
}
