/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: Class declarations are not allowed as if statement branches
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0040: Illegal start of CLASS expression.
    Syntax error ESY0040: Illegal start of CLASS expression.
---*/

if (true) {
    class A {
}
} else {
    class B {
}
}

function main(): void {
}
