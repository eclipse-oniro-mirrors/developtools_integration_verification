/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A formal parameter cannot be redeclared in an async function body
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'bar' has already been declared."]
---*/

async function foo(bar: int): Promise<void> {
    let bar: int;
}

function main(): void {
}
