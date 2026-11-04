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
arktsid: tospliced_neg_infinity_start_n
description: Array.prototype.toSpliced rejects -Infinity as start — ArkTS int params cannot accept Infinity
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0127: No matching call signature for toSpliced(Double, Int)
  Semantic error ESE0046: Type 'Double' is not compatible with type 'Int|undefined' at index 1
---*/

function main(): void {
    // test262: toSpliced(-Infinity, 2) tests JS coercion -Infinity→0
    // ArkTS: -Infinity is Double, cannot be passed to int param start
    let arr: int[] = [0, 1, 2, 3, 4];
    let result: int[] = arr.toSpliced(-Infinity, 2);
}
