/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment to the read-only global Infinity property
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0203: Cannot reference 'this' in this context."]
---*/
function main(): void {
    let global = this; global.Infinity = 42;
}
