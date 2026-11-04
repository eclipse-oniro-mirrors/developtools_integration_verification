/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Checking if execution of byte=1 succeeds
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0295: byte is a predefined type, cannot be used as an identifier"]
---*/
function main(): void {
    let byte = 1;
}
