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

// arktsid: filter_considers_new_element_values_during_iteration
// description: Array.prototype.filter considers new value of elements in array after it is called
// Conversion notes:
//  - The callback mutates srcArr[2] = -1 and srcArr[4] = -1 during iteration;
//    filter re-reads each element's live value per spec (Get(O, Pk) each step),
//    so indices 2 and 4 (now -1) fail the val > 0 predicate and are excluded.
//    The result is [1, 2, 4] (length 3). The captured `srcArr` binding is not
//    reassigned (only element indices are mutated), which ArkTS permits.
//  - Callback rewritten as a typed arrow predicate (v: int, i: int) => boolean.

function main(): void {
    let srcArr: int[] = [1, 2, 3, 4, 5];
    let resArr: int[] = srcArr.filter((val: int, _idx: int): boolean => {
        srcArr[2] = -1;
        srcArr[4] = -1;
        return val > 0;
    });
    arktest.assertEQ(resArr.length, 3, 'resArr.length');
    arktest.assertEQ(resArr[0], 1, 'resArr[0]');
    arktest.assertEQ(resArr[2], 4, 'resArr[2]');
}