/* Licensed under the Apache License, Version 2.0 */
/*---
desc: U+2000 EN QUAD after a regular expression literal
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token '/'.
    Syntax error ESY0227: Unexpected token 'x'.
    Semantic error ESE0143: Unresolved reference x
    Semantic error ESE0143: Unresolved reference g
---*/
function main(): void {
    /x/g ;
}

