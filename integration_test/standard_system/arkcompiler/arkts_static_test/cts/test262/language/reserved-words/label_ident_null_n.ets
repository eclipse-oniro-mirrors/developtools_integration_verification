/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Reserved word null cannot be used as a label identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token ':'.
---*/
function main(): void {
    null: ;
}
