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

// arktsid: reduceright_accumulator_chains_from_previous_iteration
// description: Array.prototype.reduceRight - 'accumulator' used for current iteration is the result of previous
// iteration on an Array
// Conversion notes:
//  - The JS callback returns curVal (int) while initialValue is 6.99 (number), giving a
//    heterogeneous accumulator. initialValue is changed to 100 (int) so U == T == int is
//    homogeneous. The callback verifies prev === preResult (the previous return) at each
//    step and updates preResult to curVal, checking accumulator chaining right-to-left.
//  - Mutable testResult and preResult are captured and updated in the lambda.

function main(): void {
    let arr: int[] = [11, 12, 13];
    let testResult: boolean = true;
    let initVal: int = 100;
    let preResult: int = initVal;
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        if (prev !== preResult) {
            testResult = false;
        }
        preResult = cur;
        return cur;
    }, initVal);
    arktest.assertTrue(testResult, 'testResult !== true');
}