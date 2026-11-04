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
desc: Assignment of null to a BigInt64Array element returns abrupt on null (ToBigInt(null) throws TypeError)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching indexing signature for $_set(Int, null)
    Semantic error ESE0251: Cannot find index access method with the required signature.
    Semantic error ESE0046: Type 'null' is not compatible with type 'BigInt' at index 2
---*/

function main(): void {
    let typedArray = new BigInt64Array(1);
    typedArray[0] = null;
}
