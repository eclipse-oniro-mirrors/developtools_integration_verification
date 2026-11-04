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

// arktsid: sort_numbers_default_order
// description: Default sort (no compareFn) orders numbers by their string
//   code-unit representation, like JS ToString ordering.
// Conversion notes:
//  - The source exercises ToString coercion over a mixed-type array
//    (undefined, number, string, boolean, object with valueOf/toString, NaN,
//    Infinity). ArkTS arrays are statically typed, so a mixed-type array cannot
//    be expressed 1:1. The non-numeric elements and the valueOf/toString object
//    were dropped, and a few two/three-digit integers were added so that string
//    code-unit ordering is observable (it differs from numeric ordering).
//  - Per the ArkTS sort contract, the default sort uses string code-unit
//    ordering, so [2, 1, 10, 20, -1, 100] sorts to [-1, 1, 10, 100, 2, 20].

function main(): void {
    let arr: int[] = [2, 1, 10, 20, -1, 100];
    arr.sort();

    // Expected string code-unit order: "-1" < "1" < "10" < "100" < "2" < "20".
    arktest.assertEQ(arr.length, 6, 'arr.length');
    arktest.assertEQ(arr[0], -1, 'arr[0] === -1');
    arktest.assertEQ(arr[1], 1, 'arr[1] === 1');
    arktest.assertEQ(arr[2], 10, 'arr[2] === 10');
    arktest.assertEQ(arr[3], 100, 'arr[3] === 100');
    arktest.assertEQ(arr[4], 2, 'arr[4] === 2');
    arktest.assertEQ(arr[5], 20, 'arr[5] === 20');
}