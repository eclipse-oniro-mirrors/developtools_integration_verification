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

// arktsid: map_considers_new_value_of_elements
// description: Array.prototype.map considers the new value of an element mutated during iteration (value read at visit
// time)
// Conversion notes:
//  - The callback closes over srcArr and mutates srcArr[4] = -1 (an in-bounds
//    indexed assignment) on every invocation; map reads each element's current
//    value at visit time, so by index 4 the value is -1 and the callback
//    returns 0. This observable behavior matches ArkTS map semantics.
//  - Integer literals [1, 2, 3, 4, 5] typed as Array<int>; result typed as Array<int>

function main(): void {
    let srcArr: int[] = [1, 2, 3, 4, 5];
    let resArr: int[] = srcArr.map((val: int): int => {
        srcArr[4] = -1;
        if (val > 0) {
            return 1;
        } else {
            return 0;
        }
    });
    arktest.assertEQ(resArr.length, 5, 'resArr.length');
    arktest.assertEQ(resArr[4], 0, 'resArr[4]');
}