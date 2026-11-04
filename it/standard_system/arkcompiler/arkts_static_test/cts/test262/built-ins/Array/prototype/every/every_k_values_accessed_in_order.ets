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

// arktsid: every_k_values_accessed_in_order
// description: Array.prototype.every - k values are accessed during each iteration and not prior to starting the loop
// on
// an Array
// Conversion notes:
//  - JS tracks already-visited indices with `typeof kIndex[idx] === "undefined"`; ArkTS
//    uses an int sentinel array (0 = not yet visited, 1 = visited) with the same logic.
//  - The `undefined` thisArg argument is omitted: the callback does not use `this`.

function main(): void {
    let called: int = 0;
    let kIndex: int[] = [0, 0, 0, 0];
    let result: boolean = [11, 12, 13, 14].every((val: int, idx: int, arr: int[]): boolean => {
        called++;
        if (kIndex[idx] === 0) {
            if (idx !== 0 && kIndex[idx - 1] === 0) {
                return false;
            }
            kIndex[idx] = 1;
            return true;
        } else {
            return false;
        }
    });
    arktest.assertEQ(result, true, '[11, 12, 13, 14].every(callbackfn) !== true');
    arktest.assertEQ(called, 4, 'called');
}