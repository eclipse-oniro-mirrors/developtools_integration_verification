/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A bitwise expression cannot be used as an unparsed function body element
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0227: Unexpected token '&'.", "Syntax error ESY0227: Unexpected token '1'."]
---*/

function invalidFunction(): void {
    &1
}

function main(): void {
}
