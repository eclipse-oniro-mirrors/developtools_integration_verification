/* Licensed under the Apache License, Version 2.0 */
/*---
desc: static class field forbid PropName 'constructor' (early error -- PropName of StringLiteral is forbidden)
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'constructor'.
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY0295: number is a predefined type, cannot be used as an identifier
---*/

class C {
    public static 'constructor': number;
}

