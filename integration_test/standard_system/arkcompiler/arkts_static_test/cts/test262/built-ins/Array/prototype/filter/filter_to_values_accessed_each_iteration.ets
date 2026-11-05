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

// arktsid: filter_to_values_accessed_each_iteration
// description: Array.prototype.filter - values of 'to' are accessed during each iteration when 'selected' is converted
// to true and not prior to starting the loop
// Conversion notes:
//  - Source tracked visited 'to' indices in a growable sparse array using an
//    undefined-sentinel (out-of-bounds reads). Converted to a pre-allocated
//    Array<int> tracker (0 = unvisited, 1 = visited) so the same per-index-once
//    and in-order visitation logic is preserved without relying on
//    out-of-bounds-undefined semantics.
//  - The unused thisArg (undefined) is dropped; the callback does not use this.
//  - Unused value parameter prefixed with _; only idx is consulted.

function main(): void {
    let toIndex: int[] = [0, 0, 0, 0];
    let called: int = 0;
    let newArr: int[] = [11, 12, 13, 14].filter((_val: int, idx: int): boolean => {
        called++;
        if (toIndex[idx] === 0) {
            // when current position is visited, its previous index should have been visited
            if (idx !== 0 && toIndex[idx - 1] === 0) {
                return false;
            }
            toIndex[idx] = 1;
            return true;
        } else {
            return false;
        }
    });
    arktest.assertEQ(newArr.length, 4, 'newArr.length');
    arktest.assertEQ(called, 4, 'called');
}