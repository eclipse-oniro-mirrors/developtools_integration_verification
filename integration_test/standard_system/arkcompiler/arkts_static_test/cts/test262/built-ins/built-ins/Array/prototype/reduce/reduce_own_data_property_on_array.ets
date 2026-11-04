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

// arktsid: reduce_own_data_property_on_array
// description: Array.prototype.reduce - element to be retrieved is own data property on an Array
// Conversion notes:
//  - The JS callback returned undefined and used a side-effect flag; it returns
//    cur so it conforms to the (prev, cur, idx, array) => int signature. U == int
//    with initialValue 0. At idx 1, curVal is the own data property arr[1] === 1.

function main(): void {
    let testResult: boolean = false;
    let arr: int[] = [0, 1];
    let r: int = arr.reduce<int>((prev: int, cur: int, idx: int): int => {
        if (idx === 1) {
            testResult = (cur === 1);
        }
        return cur;
    }, 0);
    arktest.assertTrue(testResult, 'testResult !== true');
}