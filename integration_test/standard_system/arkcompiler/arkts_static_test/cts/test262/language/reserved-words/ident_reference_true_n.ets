/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Reserved word true cannot be used as an identifier reference
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0062: need to specify target type for class composite
    Syntax error ESY0016: Unexpected token.
    Syntax error ESY0228: Unexpected token, expected '('.
    Syntax error ESY0230: Expected '{', got ';'.
    Syntax error ESY0016: Unexpected token.
    Syntax error ESY0228: Unexpected token, expected ')'.
    Syntax error ESY0230: Expected '}', got 'end of stream'.
---*/
function main(): void {
    ({true});
}
