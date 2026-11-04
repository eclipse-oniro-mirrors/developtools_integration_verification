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
    Array.prototype.with casts the index to an integer; ArkTS requires an int index and rejects non-int values (1.2,
    "1", "-1", NaN, "dog") at compile time
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for with(Double, Int)
    Semantic error ESE0046: Type 'Double' is not compatible with type 'Int' at index 1
---*/

function main(): void {
    let arr: int[] = [0, 4, 16];
    let r: int[] = arr.with(1.2, 7);
}
