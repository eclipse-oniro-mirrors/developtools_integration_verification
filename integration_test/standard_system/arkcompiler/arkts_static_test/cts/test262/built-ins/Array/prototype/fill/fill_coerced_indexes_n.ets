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
    Array.prototype.fill with coerced-to-integer start/end (undefined/null/bool/NaN/string/double) - ArkTS rejects
    at compile
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for fill(Int, null)",
    "Semantic error ESE0046: Type 'null' is not compatible with type 'Int|undefined' at index 2",
    "Semantic error ESE0127: No matching call signature for fill(Int, Boolean)",
    "Semantic error ESE0046: Type 'Boolean' is not compatible with type 'Int|undefined' at index 2",
    "Semantic error ESE0127: No matching call signature for fill(Int, Double)",
    "Semantic error ESE0046: Type 'Double' is not compatible with type 'Int|undefined' at index 2",
    "Semantic error ESE0127: No matching call signature for fill(Int, \"1\")",
    "Semantic error ESE0046: Type '\"1\"' is not compatible with type 'Int|undefined' at index 2",
]
---*/

function main(): void {
    let a: int[] = [0, 0];
    a.fill(1, undefined);
    a.fill(1, null);
    a.fill(1, true);
    a.fill(1, false);
    a.fill(1, NaN);
    a.fill(1, '1');
    a.fill(1, 1.5);
}
