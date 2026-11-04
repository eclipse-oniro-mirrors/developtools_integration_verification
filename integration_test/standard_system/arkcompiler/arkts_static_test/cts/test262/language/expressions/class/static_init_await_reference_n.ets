/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The `await` keyword is interpreted as a IdentifierReference in method parameter lists
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.",
    "Syntax error ESY0316: Hard keyword 'await' cannot be used as identifier",
    "Syntax error ESY0224: Identifier expected, got 'await'.",
    "Semantic error ESE173979: Await in a non-async function is deprecated; please move it to an async function.",
    "Syntax error ESY0227: Unexpected token ';'.",
]
---*/

// Conversion notes: P 源（await 作 IdentifierReference）；`var await` 绑定被拒（ESY0316）。剥离源内 `new (class{})` 避免 ESE0020
// 抢占，隔离 await 引用意图
var await = 0;
class C {
    static {
        let fromBody: number = await;
    }
}

