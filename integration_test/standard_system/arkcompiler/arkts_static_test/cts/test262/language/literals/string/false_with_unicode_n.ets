/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Reserved word false cannot contain a UnicodeEscapeSequence
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Semantic error ESE0143: Unresolved reference false
---*/
function main(): void {
    f\u{61}lse;
}
