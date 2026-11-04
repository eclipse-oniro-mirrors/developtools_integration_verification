/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword with cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0144: Function name 'with' used in the wrong context
---*/
function main(): void {
    with = 1;
}
