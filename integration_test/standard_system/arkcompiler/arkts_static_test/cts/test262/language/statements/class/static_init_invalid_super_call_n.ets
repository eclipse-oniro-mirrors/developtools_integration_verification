/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Block cannot contain SuperCall
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

// Conversion notes: static 块内 super() 调用（super static 不可表达）
class C {
    static {
        super();
    }
}

