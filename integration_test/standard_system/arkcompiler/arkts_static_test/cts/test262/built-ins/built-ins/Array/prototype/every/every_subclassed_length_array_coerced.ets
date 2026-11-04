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

// arktsid: every_subclassed_length_array_coerced
// description: Array.prototype.every returns true if 'length' is 0 (subclassed Array, length overridden with [])
// Conversion notes:
//  - The JS test overrides the array length with an empty array literal []; the default
//    valueOf/toString coercion of [] yields the number 0, so the length becomes 0 and
//    every() short-circuits to true. ArkTS length is numeric and cannot be assigned an
//    array, so the equivalent behavior (empty array) is tested directly.

function main(): void {
    let called: boolean = false;
    let arr: int[] = [];
    let result: boolean = arr.every((_v: int): boolean => {
        called = true;
        return true;
    });
    arktest.assertEQ(called, false, 'callback not invoked on empty array');
    arktest.assertEQ(result, true, 'i');
}