/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A labelled function declaration is not allowed as the sole if body
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0038: Label must be followed by a loop statement.
    Syntax error ESY0038: Label must be followed by a loop statement.
---*/

if (false) {
    label1: label2: function test262(): void {
}
}

function main(): void {
}
