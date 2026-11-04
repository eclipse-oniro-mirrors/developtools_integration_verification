/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0058: Getter must not have formal parameters."]
---*/

// Conversion notes: 源 `get a(param = null)` → 声明；getter 带参测早期错误
class C {
    get a(param: string = ''): string {
        return param;
    }
}

