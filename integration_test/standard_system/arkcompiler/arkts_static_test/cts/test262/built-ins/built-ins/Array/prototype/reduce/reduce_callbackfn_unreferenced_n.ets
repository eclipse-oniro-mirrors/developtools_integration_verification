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
    Array.prototype.reduce with an unreferenced callbackfn (foo) is rejected by ArkTS: the undeclared identifier is
    a compile-time error (JS throws ReferenceError at runtime)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0124: Expected 2 arguments, got 1.",
    "Semantic error ESE0127: No matching call signature for reduce(foo)",
    "Semantic error ESE8745: Type parameter 'U' can not be inferred for the call to 'reduce'. Specify the type
    argument explicitly.",
    "Semantic error ESE0143: Unresolved reference foo",
]
---*/

function main(): void {
    let arr: int[] = new Array<int>(10);
    arr.reduce(foo);
}
