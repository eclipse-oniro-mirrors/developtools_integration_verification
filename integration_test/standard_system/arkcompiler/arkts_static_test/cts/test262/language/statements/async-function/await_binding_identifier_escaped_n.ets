/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: An escaped await spelling cannot be used as a binding identifier
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/

async function asyncFn(): Promise<void> {
    let \u0061wait: int;
}

function main(): void {
}
