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

// arktsid: reduceright_accumulator_first_iteration_is_initialvalue
// description: Array.prototype.reduceRight - 'accumulator' used for first iteration is the value of 'initialValue' when
// it is present on an Array
// Conversion notes:
//  - The JS callback returns curVal (int) while initialValue is 6.99 (number), giving a
//    heterogeneous accumulator. initialValue is changed to 100 (int) so U == T == int is
//    homogeneous. The callback verifies prev === initialValue on the first call (idx===1
//    for [11,12] with initialValue), confirming initialValue seeds the accumulator.
//  - Mutable testResult is captured and updated in the lambda.

function main(): void {
    let arr: int[] = [11, 12];
    let testResult: boolean = false;
    let initVal: int = 100;
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        if (idx === 1) {
            testResult = (prev === initVal);
        }
        return cur;
    }, initVal);
    arktest.assertTrue(testResult, 'testResult !== true');
}