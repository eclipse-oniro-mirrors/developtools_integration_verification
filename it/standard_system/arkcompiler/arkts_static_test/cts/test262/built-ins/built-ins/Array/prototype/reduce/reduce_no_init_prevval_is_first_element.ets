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

// arktsid: reduce_no_init_prevval_is_first_element
// description: Array.prototype.reduce - element to be retrieved is own data property on an Array
// Conversion notes:
//  - assert(testResult) is expressed as an in-callback arktest.assertEQ: with no
//    initialValue the accumulator is seeded with arr[0], so at idx 1 prevVal must
//    equal arr[0] (0).
//  - The original callback returned undefined and used a side-effect flag; here it
//    returns prev + cur so it conforms to the (prev, cur, idx, array) => int signature.

function main(): void {
    let arr: int[] = [0, 1, 2];
    arr.reduce((prev: int, cur: int, idx: int, a: int[]): int => {
        if (idx === 1) {
            arktest.assertEQ(prev, 0, 'prevVal at idx 1 === arr[0]');
        }
        return prev + cur;
    });
}