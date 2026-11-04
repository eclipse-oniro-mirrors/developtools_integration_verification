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

// arktsid: reduceright_accumulator_first_iteration_is_last_element_no_init
// description: Array.prototype.reduceRight - value of 'accumulator' used for first iteration is the value of max index
// property which is not undefined when 'initialValue' is not present on an Array
// Conversion notes:
//  - U == T == int (homogeneous, no initialValue). Mutable testResult captured in the lambda.

function main(): void {
    let arr: int[] = [11, 12, 13];
    let testResult: boolean = false;
    let r: int = arr.reduceRight((prev: int, cur: int, idx: int, a: int[]): int => {
        if (idx === 1) {
            testResult = (prev === 13);
        }
        return cur;
    });
    arktest.assertTrue(testResult, 'testResult !== true');
}