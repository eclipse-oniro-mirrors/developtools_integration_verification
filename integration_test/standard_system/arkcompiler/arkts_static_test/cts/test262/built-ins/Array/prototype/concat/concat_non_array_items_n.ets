/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: |
    Array.prototype.concat with non-array items (JS appends objects and primitives as single items) - ArkTS concat()
    only accepts arrays, primitives are rejected at compile
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for concat(Int, Boolean, \"NaN\")",
    "Semantic error ESE0323: Type 'Int' is not compatible with rest parameter type 'ConcatArray<Int>' at index 1",
]
---*/

function main(): void {
    let x: int[] = [0];
    let arr: int[] = x.concat(-1, true, 'NaN');
}
