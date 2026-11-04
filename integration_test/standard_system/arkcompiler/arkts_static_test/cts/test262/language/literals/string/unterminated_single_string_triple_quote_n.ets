/* Licensed under the Apache License, Version 2.0 */
/*---
desc: A triple single quote sequence is not a valid string literal
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0265: Newline is not allowed in strings
    Syntax error ESY0227: Unexpected token ''.
---*/
function main(): void {
    '''
}
