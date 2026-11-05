/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: Function declarations are not allowed in both strict if branches
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0135: Nested functions are not allowed.
---*/

if (true) {
    function f(): void {
}
} else {
    function g(): void {
}
}

function main(): void {
}
