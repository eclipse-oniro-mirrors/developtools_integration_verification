/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A rest parameter cannot be followed by a trailing comma
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0067: Rest parameter must be the last formal parameter."]
---*/

function invalidFunction(...args: int[],): void {
}

function main(): void {
}
