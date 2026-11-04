/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Creation of new environment record for variable-scoped bindings
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.
    Semantic error ESE0365: Variable 'test262' is accessed before it's initialization.
    Syntax error ESY0034: Only one static block is allowed in one namespace or class.
---*/

// Conversion notes: P 源（var 作用域）；`var` 不支持（ESY0297）
var test262: string = 'outer scope';
var probe1: string = '';
var probe2: string = '';
class C {
    static {
        var test262: string = 'first block';
        probe1 = test262;
    }
    static {
        var test262: string = 'second block';
        probe2 = test262;
    }
}

