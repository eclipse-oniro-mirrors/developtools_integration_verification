/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Reserved word null cannot contain a UnicodeEscapeSequence
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Semantic error ESE0143: Unresolved reference null
---*/
function main(): void {
    n\u{75}ll;
}
