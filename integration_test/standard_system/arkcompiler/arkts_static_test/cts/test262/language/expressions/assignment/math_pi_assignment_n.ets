/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment to the read-only Math.PI property
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE4002: Cannot assign to a readonly field PI"]
---*/
function main(): void {
    Math.PI = 20;
}
