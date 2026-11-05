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
desc: Array.prototype.copyWithin end argument object - ToInteger(end) abrupt in JS, ArkTS rejects object end at compile
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for copyWithin(Int, Int, Object)
    Semantic error ESE0046: Type 'Object' is not compatible with type 'Int|undefined' at index 3
---*/

function main(): void {
    let a: int[] = [0, 1, 2, 3];
    let o1: Object = {};
    a.copyWithin(0, 0, o1);
}
