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
    Array.prototype.forEach - thisArg (Error object) not supported: ArkTS forEach accepts only a callbackfn, the
    second thisArg argument is rejected at compile time
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0124: Expected 1 arguments, got 2.",
    "Semantic error ESE0127: No matching call signature for forEach(((p1: Int, p2: Int, p3: Array<Int>) =>
    undefined), RangeError)",
]
---*/

function main(): void {
    let objError: RangeError = new RangeError();
    let arr: int[] = [11];
    arr.forEach((val: int, idx: int, obj: int[]): void => {}, objError);
}
