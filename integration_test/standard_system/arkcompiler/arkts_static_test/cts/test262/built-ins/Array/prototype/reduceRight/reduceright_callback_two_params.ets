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

// arktsid: reduceright_callback_two_params
// description: Array.prototype.reduceRight - callbackfn is called with 2 formal parameter
// Conversion notes:
//  - The JS callback returns a boolean (curVal > 10) while initialValue is 100 (number),
//    giving a heterogeneous accumulator. initialValue is changed to true so U is uniformly
//    boolean; the prev === initialValue check becomes prev === initVal. With the single
//    element [11] there is one callback call, so result (true) and testResult (true) are
//    unchanged from the original.

function main(): void {
    let testResult: boolean = false;
    let initVal: boolean = true;
    let arr: int[] = [11];
    let result: boolean = arr.reduceRight<boolean>((prev: boolean, cur: int): boolean => {
        if (prev === initVal) {
            testResult = true;
        }
        return cur > 10;
    }, initVal);
    arktest.assertEQ(result, true, '[11].reduceRight(callbackfn, 100)');
    arktest.assertTrue(testResult, 'testResult !== true');
}