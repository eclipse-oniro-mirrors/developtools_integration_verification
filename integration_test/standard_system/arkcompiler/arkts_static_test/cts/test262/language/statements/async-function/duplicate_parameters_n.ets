/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: Strict async functions reject duplicate formal parameters
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'a' has already been declared."]
---*/

async function foo(a: int, a: int): Promise<void> {
}

function main(): void {
}
