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
    Array.prototype.copyWithin start coerced to integer (undefined/bool/NaN/null/string/double) - ArkTS rejects at
    compile
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for copyWithin(Int, undefined)",
    "Semantic error ESE0046: Type 'undefined' is not compatible with type 'Int' at index 2",
    "Semantic error ESE0127: No matching call signature for copyWithin(Int, Boolean)",
    "Semantic error ESE0046: Type 'Boolean' is not compatible with type 'Int' at index 2",
    "Semantic error ESE0127: No matching call signature for copyWithin(Int, Double)",
    "Semantic error ESE0046: Type 'Double' is not compatible with type 'Int' at index 2",
    "Semantic error ESE0127: No matching call signature for copyWithin(Int, null)",
    "Semantic error ESE0046: Type 'null' is not compatible with type 'Int' at index 2",
    "Semantic error ESE0127: No matching call signature for copyWithin(Int, \"1\")",
    "Semantic error ESE0046: Type '\"1\"' is not compatible with type 'Int' at index 2",
]
---*/

function main(): void {
    let a: int[] = [0, 1, 2, 3];
    a.copyWithin(1, undefined);
    a.copyWithin(1, false);
    a.copyWithin(1, NaN);
    a.copyWithin(1, null);
    a.copyWithin(0, true);
    a.copyWithin(0, '1');
    a.copyWithin(1, 0.5);
    a.copyWithin(0, 1.5);
}
