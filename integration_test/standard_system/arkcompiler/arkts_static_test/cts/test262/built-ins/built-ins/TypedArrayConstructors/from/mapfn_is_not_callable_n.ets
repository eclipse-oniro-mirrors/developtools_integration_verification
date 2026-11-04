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
desc: TypedArray.from rejects a non-callable mapfn argument (null representative)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for from(Array<Int>, null)
    Semantic error ESE0046: Type 'Array<Int>' is not compatible with type 'Iterable<Double>' at index 1
---*/

function main(): void {
    let result = Int32Array.from([1, 2, 3], null);
}
