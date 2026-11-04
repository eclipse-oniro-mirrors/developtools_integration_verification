/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Keyword finally cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0143: Unresolved reference finally
---*/
function main(): void {
    finally = 1;
}
