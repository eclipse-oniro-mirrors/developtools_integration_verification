/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: Async function declarations are not allowed as if statement branches
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0320: Function expressions are not supported, use arrow functions instead
    Syntax error ESY0227: Unexpected token 'else'.
    Syntax error ESY0320: Function expressions are not supported, use arrow functions instead
---*/

if (true) {
    async function f(): Promise<void> {
}
} else {
    async function g(): Promise<void> {
}
}

function main(): void {
}
