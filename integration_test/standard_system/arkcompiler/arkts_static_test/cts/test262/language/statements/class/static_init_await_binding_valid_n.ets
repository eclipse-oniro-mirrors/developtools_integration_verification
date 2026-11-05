/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The `await` keyword is interpreted as an identifier within arrow function bodies
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'await' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'await'.
---*/

// Conversion notes: P 源（断言箭头体内 await 作标识符合法）；`await` 硬关键字 ESY0316
class C {
    static {
        ((): void => {
            let await: int = 1;
        });
    }
}

