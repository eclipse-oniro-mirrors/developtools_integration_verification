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
    Array.prototype.some - thisArg (Array with own data property) not supported: ArkTS some accepts only a
    predicate, the second thisArg argument is rejected at compile time
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0124: Expected 1 arguments, got 2.
    Semantic error ESE0127: No matching call signature for some(((p1: Int) => Boolean), Array<Int>)
---*/

function main(): void {
    let a: int[] = [];
    let arr: int[] = [1];
    arr.some((val: int): boolean => { return true; }, a);
}
