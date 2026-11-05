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

// arktsid: reduceright_callbackfn_correct_parameters_no_initialvalue
// description: Array.prototype.reduceRight - callbackfn called with correct parameters (initialvalue not passed)
// Conversion notes:
//  - The JS array mixes numbers/booleans/null/Object/string; ArkTS arrays are
//    homogeneous, so it is adapted to [0, 1, 2, 3, 4, 5] (int). reduceRight without
//    initialValue starts with prevVal = arr[5] and the callback verifies that each
//    call receives obj[idx] === curVal and obj[idx + 1] === prevVal, reducing to 0.

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4, 5];
    let result: int = arr.reduceRight((prev: int, cur: int, idx: int, a: int[]): int => {
        if (idx + 1 < a.length && a[idx] === cur && a[idx + 1] === prev) {
            return cur;
        }
        return -1;
    });
    arktest.assertEQ(result, 0, 'arr.reduceRight(callbackfn)');
}