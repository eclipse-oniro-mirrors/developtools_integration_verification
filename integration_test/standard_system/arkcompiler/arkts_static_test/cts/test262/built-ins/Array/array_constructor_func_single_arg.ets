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

// arktsid: array_constructor_func_single_arg
// description: Array constructor (called as function) with one argument treats the argument as an element, not as a
// length
// Conversion notes:
//  - JS `Array(2)` builds a sparse length-2 array, so the original asserts
//    notSameValue(length, 1) and notSameValue(x[0], 2). ArkTS's public
//    Array constructor overload is (first: T, ...d: T[]) (the length-only
//    constructor is private), so a single argument becomes element 0 with
//    length 1. The ArkTS semantics (length 1, element 2) are asserted positively.

function main(): void {
    let x: int[] = [2];

    arktest.assertEQ(x.length, 1, 'x.length is 1 (single argument is an element)');
    arktest.assertEQ(x[0], 2, 'x[0] is 2');
}