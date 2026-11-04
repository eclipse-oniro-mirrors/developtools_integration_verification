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
    array index 4294967294 exceeds int32 - ArkTS rejects at compile (Long index). Array.prototype.indexOf must
    return correct index (Sparse Array)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching indexing signature for $_set(Long, Int)
    Semantic error ESE0251: Cannot find index access method with the required signature.
    Semantic error ESE0046: Type 'Long' is not compatible with type 'Int' at index 1
---*/

function main(): void {
    let a: int[] = [0, 0];
    a[4294967294] = 2;
}
