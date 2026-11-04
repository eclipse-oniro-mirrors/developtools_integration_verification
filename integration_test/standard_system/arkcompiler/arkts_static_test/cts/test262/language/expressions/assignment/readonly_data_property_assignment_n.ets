/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment to a non-writable data property
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0174: Cannot infer type for obj because class composite needs an explicit target type
    Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'
---*/
function main(): void {
        let obj = {}; Object.defineProperty(obj, 'prop' +
}
