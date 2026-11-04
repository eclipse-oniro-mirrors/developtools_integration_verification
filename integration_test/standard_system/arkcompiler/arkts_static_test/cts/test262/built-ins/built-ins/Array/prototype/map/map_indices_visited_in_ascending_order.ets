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

// arktsid: map_indices_visited_in_ascending_order
// description: Array.prototype.map - k values are passed in ascending numeric order
// Conversion notes:
//  - Mutable lastIdx, called counters and result flag declared as int/boolean
//    and updated inside the callback
//  - Integer literals [0..5] typed as Array<int>

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4, 5];
    let lastIdx: int = 0;
    let called: int = 0;
    let result: boolean = true;
    let resArr: boolean[] = arr.map((v: int, i: int): boolean => {
        called++;
        if (lastIdx !== i) {
            result = false;
        } else {
            lastIdx++;
        }
        return true;
    });
    arktest.assertEQ(result, true, 'result !== true');
    arktest.assertEQ(arr.length, called, 'arr.length');
}