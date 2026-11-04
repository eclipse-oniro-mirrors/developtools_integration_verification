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

// arktsid: reduce_callbackfn_correct_parameters_initialvalue
// description: Array.prototype.reduce - callbackfn called with correct parameters (initialvalue passed)
// Conversion notes:
//  - The heterogeneous JS array is adapted to [0, 1, 2, 3, 4, 5] (int) and the
//    initialValue 5.5 is changed to 100 (int) so the accumulator type stays
//    homogeneous. The callback verifies that on the first call (idx === 0)
//    prevVal === initialValue and obj[idx] === curVal, and on later calls that
//    obj[idx] === curVal and obj[idx - 1] === prevVal.

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4, 5];
    let initVal: int = 100;
    let result: int = arr.reduce<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        if (idx === 0 && a[idx] === cur && prev === initVal) {
            return cur;
        }
        if (idx > 0 && a[idx] === cur && a[idx - 1] === prev) {
            return cur;
        }
        return -1;
    }, initVal);
    arktest.assertEQ(result, 5, 'arr.reduce(callbackfn, initialValue)');
}