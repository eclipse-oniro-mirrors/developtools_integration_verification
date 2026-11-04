/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0298: Use 'private' keyword to declare an identifier as private.
    Syntax error ESY0228: Unexpected token, expected '('.
    Semantic error ESE0017: Only abstract or native methods can't have body.
    Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.
    Syntax error ESY0194: Parameter declaration should have an explicit type annotation.
    Syntax error ESY0229: Unexpected token, expected ',' or ')'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Syntax error ESY0058: Getter must not have formal parameters.
---*/

// Conversion notes: # 私有名 setter/getter 静态冲突（ArkTS 无私有名）
class C {
  set #f(v) {}
  static get #f() {}
}

