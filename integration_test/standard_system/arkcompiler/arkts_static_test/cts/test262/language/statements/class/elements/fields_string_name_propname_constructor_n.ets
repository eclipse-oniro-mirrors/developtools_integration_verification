/* Licensed under the Apache License, Version 2.0 */
/*---
desc: class fields forbid PropName 'constructor' (early error -- PropName of StringLiteral is forbidden value)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token 'constructor'.",
    "Syntax error ESY0227: Unexpected token ':'.",
    "Syntax error ESY0295: number is a predefined type, cannot be used as an identifier",
]
---*/

class C {
    public 'constructor': number;
}

