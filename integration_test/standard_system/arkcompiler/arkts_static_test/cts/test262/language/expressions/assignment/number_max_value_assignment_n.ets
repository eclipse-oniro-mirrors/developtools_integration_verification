/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Assignment to the read-only Number.MAX_VALUE property
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE4002: Cannot assign to a readonly field MAX_VALUE"]
---*/
function main(): void {
    Number.MAX_VALUE = 42;
}
