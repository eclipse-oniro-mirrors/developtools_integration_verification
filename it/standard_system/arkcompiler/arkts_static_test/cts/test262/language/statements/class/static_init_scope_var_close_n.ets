/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Destruction of environment record for variable-scoped bindings
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.
    Syntax error ESY0034: Only one static block is allowed in one namespace or class.
---*/

// Conversion notes: P 源（var 作用域收口）；`var` 不支持（ESY0297）
var test262: string = 'outer scope';
var probe: string = '';
class C {
    static {
        var test262: string = 'first block';
    }
    static {
        probe = test262;
    }
}

