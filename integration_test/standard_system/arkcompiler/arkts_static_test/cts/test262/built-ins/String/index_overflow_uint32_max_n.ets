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
// arktsid: index_overflow_uint32_max_n
// description: String indexing with a numeric index >= 2^32-1 returns undefined in test262; ArkTS rejects the
// Double index at compile time

/*---
desc: String bracket index with Math.pow(2,32)-1 is rejected at compile time (non-int index)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching indexing signature for $_get(Double)",
    "Semantic error ESE0251: Cannot find index access method with the required signature.",
    "Semantic error ESE0046: Type 'Double' is not compatible with type 'Int' at index 1",
]
---*/

function main(): void {
    let s: string = String('hello world');
    let x: string = s[Math.pow(2, 32) - 1];
}
