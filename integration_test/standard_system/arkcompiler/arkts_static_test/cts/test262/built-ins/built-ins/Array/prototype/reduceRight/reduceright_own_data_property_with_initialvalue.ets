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

// arktsid: reduceright_own_data_property_with_initialvalue
// description: Array.prototype.reduceRight - element to be retrieved is own data property on an Array
// Conversion notes:
//  - The JS initialValue was the string "initialValue" while the array is int;
//    it is changed to 0 (int) so U == T == int is homogeneous. The initialValue
//    is not used by the asserted check. The original returned undefined; it
//    returns cur to satisfy the (prev, cur, idx, array) => int signature.
//    reduceRight visits idx 2, then idx 1 where curVal === 1.

function main(): void {
    let testResult: boolean = false;
    let arr: int[] = [0, 1, 2];
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int): int => {
        if (idx === 1) {
            testResult = (cur === 1);
        }
        return cur;
    }, 0);
    arktest.assertTrue(testResult, 'testResult !== true');
}