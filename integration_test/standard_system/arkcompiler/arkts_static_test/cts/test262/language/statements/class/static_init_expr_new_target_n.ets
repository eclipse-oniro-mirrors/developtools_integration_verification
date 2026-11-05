/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The "new.target" value within a static initialization block is undefined
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE153545: 'any' type annotation is forbidden", "Syntax error ESY0138: Invalid Type."]
---*/

// Conversion notes: P 源（断言 new.target 为 undefined）；new.target 不可表达
let value: any = null;
class C {
    static {
        value = new.target;
    }
}

