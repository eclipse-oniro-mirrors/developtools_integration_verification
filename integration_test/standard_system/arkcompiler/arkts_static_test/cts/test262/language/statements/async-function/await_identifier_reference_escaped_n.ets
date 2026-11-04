/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: An escaped await spelling cannot be used as an identifier reference
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'void'.
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Syntax error ESY0227: Unexpected token 'await'.
    Semantic error ESE0143: Unresolved reference await
---*/

async function asyncFn(): Promise<void> {
    void \u0061wait;
}

function main(): void {
}
