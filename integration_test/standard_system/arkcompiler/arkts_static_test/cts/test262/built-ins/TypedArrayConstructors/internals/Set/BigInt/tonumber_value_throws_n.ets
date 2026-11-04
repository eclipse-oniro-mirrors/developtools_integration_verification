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
    Assignment of a plain object to a BigInt64Array element is a compile-time type error (JS ToBigInt calls valueOf
    and throws)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching indexing signature for $_set(Int, Object)
    Semantic error ESE0251: Cannot find index access method with the required signature.
    Semantic error ESE0046: Type 'Object' is not compatible with type 'BigInt' at index 2
---*/

function main(): void {
    let typedArray = new BigInt64Array(1);
    let obj = {} as Object;
    typedArray[0] = obj;
}
