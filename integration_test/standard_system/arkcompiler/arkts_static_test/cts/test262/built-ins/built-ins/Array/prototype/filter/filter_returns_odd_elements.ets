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

// arktsid: filter_returns_odd_elements
// description: Array.prototype.filter - getOwnPropertyDescriptor(all true) of returned array element; values are
// the odd
// description: Array.prototype.filter - getOwnPropertyDescriptor(all true) of returned array element; values are
// the odd
// elements of [0, 1, 2, 3, 4]
// Conversion notes:
//  - Object.getOwnPropertyDescriptor is not available in ArkTS, so the
//    writable/enumerable/configurable-all-true descriptor checks are dropped.
//  - The filter value semantics are preserved: the predicate keeps the odd
//    values, and the returned element values are asserted (index 1 is 3).
//  - The original `if (val % 2) return true; else return false;` was written
//    as `val % 2 !== 0` because ArkTS requires an explicit boolean expression.

function main(): void {
    let srcArr: int[] = [0, 1, 2, 3, 4];
    let resArr: int[] = srcArr.filter((val: int): boolean => { return val % 2 !== 0; });
    arktest.assertTrue(resArr.length > 0, 'resArr.length > 0');
    arktest.assertEQ(resArr[0], 1, 'resArr[0]');
    arktest.assertEQ(resArr[1], 3, 'resArr[1]');
}