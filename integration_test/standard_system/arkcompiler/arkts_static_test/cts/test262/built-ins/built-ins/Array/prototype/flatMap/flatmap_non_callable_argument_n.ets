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
desc: Array.prototype.flatMap throws a TypeError when the mapper argument is not callable
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for flatMap(Int)",
    "Semantic error ESE0046: Type 'Int' is not compatible with type '((p1: Int, p2: Int, p3: Array<Int>) =>
    T|ReadonlyArray<T>)' at index 1",
    "Semantic error ESE0127: No matching call signature for flatMap(\"\")",
    "Semantic error ESE0046: Type '\"\"' is not compatible with type '((p1: Int, p2: Int, p3: Array<Int>) =>
    T|ReadonlyArray<T>)' at index 1",
    "Semantic error ESE0063: Target type for class composite needs to be an object type, found '((p1: Int, p2: Int,
    p3: Array<Int>) => T|ReadonlyArray<T>)'",
    "Semantic error ESE0127: No matching call signature for flatMap(Boolean)",
    "Semantic error ESE0046: Type 'Boolean' is not compatible with type '((p1: Int, p2: Int, p3: Array<Int>) =>
    T|ReadonlyArray<T>)' at index 1",
    "Semantic error ESE0127: No matching call signature for flatMap(null)",
    "Semantic error ESE0046: Type 'null' is not compatible with type '((p1: Int, p2: Int, p3: Array<Int>) =>
    T|ReadonlyArray<T>)' at index 1",
    "Semantic error ESE0127: No matching call signature for flatMap(undefined)",
    "Semantic error ESE0046: Type 'undefined' is not compatible with type '((p1: Int, p2: Int, p3: Array<Int>) =>
    T|ReadonlyArray<T>)' at index 1",
]
---*/

function main(): void {
    let a: int[] = [1, 2];
    let r0 = a.flatMap(0);
    let r1 = a.flatMap('');
    let r2 = a.flatMap({});
    let r3 = a.flatMap(false);
    let r4 = a.flatMap(null);
    let r5 = a.flatMap(undefined);
}
