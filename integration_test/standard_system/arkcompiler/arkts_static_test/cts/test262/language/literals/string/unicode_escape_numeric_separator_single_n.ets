/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Numeric separators are not allowed in Unicode code point escapes
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0091: Invalid Unicode escape.
---*/
function main(): void {
    '\u{1F_639}'
}
