/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: An async function declaration is not allowed before an if else branch
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0320: Function expressions are not supported, use arrow functions instead
    Syntax error ESY0227: Unexpected token 'else'.
---*/

if (true) {
    async function f(): Promise<void> {
} else {
}
}

function main(): void {
}
