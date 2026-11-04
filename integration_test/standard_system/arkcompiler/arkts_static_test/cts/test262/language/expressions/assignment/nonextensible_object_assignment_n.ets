/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment of a new property to a non-extensible object
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0174: Cannot infer type for obj because class composite needs an explicit target type
    Semantic error ESE0087: Property 'preventExtensions' does not exist on type 'Object'
---*/
function main(): void {
    let obj = {}; Object.preventExtensions(obj); obj.len = 10;
}
