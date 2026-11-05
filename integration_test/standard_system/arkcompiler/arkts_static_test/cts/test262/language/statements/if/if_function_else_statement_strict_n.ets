/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A function declaration is not allowed in the first strict if branch
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

if (true) {
    function f(): void {
} else {
}
}

function main(): void {
}
