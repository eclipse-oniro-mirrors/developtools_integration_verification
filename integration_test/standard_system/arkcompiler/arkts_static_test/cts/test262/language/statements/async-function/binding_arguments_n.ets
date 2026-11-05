/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: arguments cannot be used as an async function binding name
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0207: 'eval' or 'arguments' can't be defined or assigned to in strict mode code."]
---*/

async function arguments(): Promise<void> {
}

function main(): void {
}
