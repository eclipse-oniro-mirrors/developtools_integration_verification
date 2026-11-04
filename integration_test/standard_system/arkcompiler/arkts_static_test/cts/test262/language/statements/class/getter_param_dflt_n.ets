/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0058: Getter must not have formal parameters."]
---*/

// Conversion notes: getter 带参测早期错误（ESY0058）
class C {
    get a(param: string = ''): string {
        return param;
    }
}

