/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment to the read-only Function.length property
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'length' does not exist on type 'Function'"]
---*/
function main(): void {
    Function.length = 42;
}
