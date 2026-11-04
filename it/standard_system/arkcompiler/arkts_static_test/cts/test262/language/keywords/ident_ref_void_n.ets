/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword void cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'void'.
---*/
function main(): void {
    void = 1;
}
