/* Licensed under the Apache License, Version 2.0 */
/*---
desc: An octal escape before a strict directive is rejected
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0258: Invalid character escape sequence.
---*/
function main(): void {
    'asterisk: \052';
    'use strict';
}
