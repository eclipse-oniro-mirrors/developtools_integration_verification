/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: An async function formal parameter cannot contain a super call
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type 'Int|*ERROR_TYPE*' cannot be assigned to type 'Int'
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

async function foo(foo: int = super()): Promise<void> {
}

function main(): void {
}
