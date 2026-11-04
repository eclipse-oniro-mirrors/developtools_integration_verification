/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Derivation of environment record for variable-scoped bindings
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead."]
---*/

// Conversion notes: P 源（var 作用域派生）；`var` 不支持（ESY0297）
var test262: string = 'outer scope';
var probe: string = '';
class C {
    static {
        probe = test262;
    }
}

