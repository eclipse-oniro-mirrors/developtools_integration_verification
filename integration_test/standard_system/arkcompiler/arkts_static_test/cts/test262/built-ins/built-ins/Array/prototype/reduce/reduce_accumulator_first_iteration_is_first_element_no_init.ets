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

// arktsid: reduce_accumulator_first_iteration_is_first_element_no_init
// description: Array.prototype.reduce - value of 'accumulator' used for first iteration is the value of least index
// property which is not undefined when 'initialValue' is not present on an Array

function main(): void {
    let called: int = 0;
    let result: boolean = false;
    let arr: int[] = [11, 9];
    let r: int = arr.reduce((prev: int, cur: int, idx: int): int => {
        called = called + 1;
        if (idx === 1) {
            result = (prev === 11) && cur === 9;
        }
        return cur;
    });
    arktest.assertTrue(result, 'result !== true');
    arktest.assertEQ(called, 1, 'called');
}