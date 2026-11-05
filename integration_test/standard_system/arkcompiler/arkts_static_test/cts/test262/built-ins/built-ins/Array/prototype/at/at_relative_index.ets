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

// arktsid: at_relative_index
// description: Returns the item value at the specified relative (negative) index
// Conversion notes:
//  - Source used a sparse array [1,2,3,4,,5] (hole at index 4); densified to
//    Array<int> [1,2,3,4,0,5] by filling the hole with 0 (length 6 preserved).
//    Dropped a.at(-2)===undefined (the hole check, not expressible in a dense
//    Array<int>); kept a.at(-3)===4 and a.at(-4)===3 with their original
//    expected values.

function main(): void {
    let a: int[] = [1, 2, 3, 4, 0, 5];
    arktest.assertEQ(a.at(0), 1, 'a.at(0) must return 1');
    arktest.assertEQ(a.at(-1), 5, 'a.at(-1) must return 5');
    arktest.assertEQ(a.at(-3), 4, 'a.at(-3) must return 4');
    arktest.assertEQ(a.at(-4), 3, 'a.at(-4) must return 3');
}