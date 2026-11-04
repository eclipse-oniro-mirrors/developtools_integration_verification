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
    indexOf with non-int arg (Object fromIndex with valueOf side effect) - ArkTS rejects at compile.
    Array.prototype.indexOf - added properties in step 5 are visible here on an Array (fromIndex object whose
    valueOf mutates the array) is not expressible: fromIndex must be int in ArkTS
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for indexOf(Int, Object)",
    "Semantic error ESE0046: Type 'Object' is not compatible with type 'Int|undefined' at index 2",
]
---*/

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4];
    let fromIndex: Object = {};
    arr.indexOf(2, fromIndex);
}
