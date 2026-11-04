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

// arktsid: map_k_values_accessed_each_iteration
// description: Array.prototype.map - k values are accessed during each iteration and not prior to starting the loop
// Conversion notes:
//  - The JS callback used `typeof kIndex[idx] === "undefined"` slot checks on a
//    sparse companion array; ArkTS Array<int> has no undefined slots, so visited
//    indices are tracked with `kIndex.indexOf(idx) === -1` and `kIndex.push(idx)`.
//  - The callback returns boolean; map yields Array<boolean> whose elements are
//    asserted directly (JS asserted testResult[0..3] are all false).

function main(): void {
    let kIndex: int[] = [];
    let resArr: boolean[] = [11, 12, 13, 14].map((val: int, idx: int): boolean => {
        if (kIndex.indexOf(idx) === -1) {
            if (idx !== 0 && kIndex.indexOf(idx - 1) === -1) {
                return true;
            }
            kIndex.push(idx);
            return false;
        } else {
            return true;
        }
    });
    arktest.assertEQ(resArr.length, 4, 'resArr.length');
    arktest.assertEQ(resArr[0], false, 'resArr[0]');
    arktest.assertEQ(resArr[1], false, 'resArr[1]');
    arktest.assertEQ(resArr[2], false, 'resArr[2]');
    arktest.assertEQ(resArr[3], false, 'resArr[3]');
}