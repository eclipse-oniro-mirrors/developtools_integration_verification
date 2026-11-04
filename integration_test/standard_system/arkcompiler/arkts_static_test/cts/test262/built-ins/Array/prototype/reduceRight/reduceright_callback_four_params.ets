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

// arktsid: reduceright_callback_four_params
// description: Array.prototype.reduceRight - callbackfn is called with 4 formal parameter
// Conversion notes:
//  - The JS callback returns a boolean (curVal > 10 && obj[idx] === curVal) while
//    initialValue is 6.99 (number), giving a heterogeneous accumulator. initialValue is
//    changed to true so U is uniformly boolean; the prev === initialValue check (at idx===2,
//    the first reduceRight call) becomes prev === initVal. Result (true) and testResult
//    (true) are unchanged from the original.
//  - All 4 formal parameters (prev, cur, idx, array) are used, matching the original.

function main(): void {
    let testResult: boolean = false;
    let initVal: boolean = true;
    let arr: int[] = [11, 12, 13];
    let result: boolean = arr.reduceRight<boolean>((prev: boolean, cur: int, idx: int, a: int[]): boolean => {
        if (idx === 2) {
            testResult = (prev === initVal);
        }
        return cur > 10 && a[idx] === cur;
    }, initVal);
    arktest.assertEQ(result, true, 'arr.reduceRight(callbackfn, initVal)');
    arktest.assertTrue(testResult, 'testResult !== true');
}