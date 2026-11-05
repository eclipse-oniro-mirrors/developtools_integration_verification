/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A class declaration is not allowed as a do-while body
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0040: Illegal start of CLASS expression.
    Syntax error ESY0300: Missing body in do while statement
---*/

do {
    class C {
}
} while (false);

function main(): void {
}
