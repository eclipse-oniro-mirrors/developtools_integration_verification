/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The `await` keyword is disallowed as a BindingIdentifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'await' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'await'.
---*/

// Conversion notes: static 块内 `await` 不能作为绑定标识符（ESY0316）
class C {
    static {
        let await: int = 1;
    }
}

