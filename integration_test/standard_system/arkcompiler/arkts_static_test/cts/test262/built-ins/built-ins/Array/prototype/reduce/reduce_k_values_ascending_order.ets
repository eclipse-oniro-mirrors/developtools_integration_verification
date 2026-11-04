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

// arktsid: reduce_k_values_ascending_order
// description: Array.prototype.reduce - k values are passed in acending numeric order on an Array
// Conversion notes:
//  - reduce visits indices in ascending order; the callback checks idx === lastIdx
//    then increments (0, 1, 2). The JS callback returned undefined; it returns cur
//    to satisfy the (prev, cur, idx, array) => int signature. U == int, initialValue 11.

function main(): void {
    let arr: int[] = [0, 1, 2];
    let lastIdx: int = 0;
    let result: boolean = true;
    let accessed: boolean = false;
    let r: int = arr.reduce<int>((prev: int, cur: int, idx: int): int => {
        accessed = true;
        if (lastIdx !== idx) {
            result = false;
        } else {
            lastIdx = lastIdx + 1;
        }
        return cur;
    }, 11);
    arktest.assertTrue(result, 'result !== true');
    arktest.assertTrue(accessed, 'accessed !== true');
}