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

// arktsid: reduceright_k_values_accessed_each_iteration
// description: Array.prototype.reduceRight - k values are accessed during each iteration and not prior to starting the
// loop on an Array
// Conversion notes:
//  - reduceRight visits indices in descending order; the callback checks each
//    index is visited once and that idx+1 was visited before idx (except the
//    last index). The JS callback used `typeof kIndex[idx] === "undefined"`
//    slot checks on a sparse companion array; ArkTS Array<int> has no undefined
//    slots, so visited indices are tracked with `kIndex.indexOf(idx) === -1`
//    and `kIndex.push(idx)`.
//  - The JS callback returned undefined; it returns cur to satisfy the
//    (prev, cur, idx, array) => int signature. U == int, initialValue 1.

function main(): void {
    let arr: int[] = [11, 12, 13, 14];
    let kIndex: int[] = [];
    let result: boolean = true;
    let called: int = 0;
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int): int => {
        called = called + 1;
        if (kIndex.indexOf(idx) === -1) {
            if (idx !== arr.length - 1 && kIndex.indexOf(idx + 1) === -1) {
                result = false;
            }
            kIndex.push(idx);
        } else {
            result = false;
        }
        return cur;
    }, 1);
    arktest.assertTrue(result, 'result !== true');
    arktest.assertEQ(called, 4, 'called');
}