/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Methods cannot contain direct super (class expression)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

// Conversion notes: 源含 `extends Function`（不可扩展 ESE0176 抢占）→ 剥离 heritage 隔离 super() 错误
class C {
    method(): void {
        super();
    }
}

