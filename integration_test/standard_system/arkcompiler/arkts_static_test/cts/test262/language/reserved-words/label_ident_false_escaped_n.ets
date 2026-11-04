/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Escaped reserved word false cannot be used as a label identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Syntax error ESY0038: Label must be followed by a loop statement.
---*/
function main(): void {
    f\u0061lse: ;
}
