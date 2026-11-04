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

// arktsid: copywithin_negative_out_of_bounds_target
// description: Set values with out of bounds negative target argument.

function main(): void {
    let a1: int[] = [0, 1, 2, 3];
    let r1: int[] = a1.copyWithin(-10, 0);
    arktest.assertEQ(r1.length, 4, '[0,1,2,3].copyWithin(-10,0) length === 4');
    arktest.assertEQ(r1[0], 0, '[0,1,2,3].copyWithin(-10,0) [0] === 0');
    arktest.assertEQ(r1[1], 1, '[0,1,2,3].copyWithin(-10,0) [1] === 1');
    arktest.assertEQ(r1[2], 2, '[0,1,2,3].copyWithin(-10,0) [2] === 2');
    arktest.assertEQ(r1[3], 3, '[0,1,2,3].copyWithin(-10,0) [3] === 3');

    let a2: int[] = [0, 1, 2, 3, 4];
    let r2: int[] = a2.copyWithin(-10, 2);
    arktest.assertEQ(r2.length, 5, '[0,1,2,3,4].copyWithin(-10,2) length === 5');
    arktest.assertEQ(r2[0], 2, '[0,1,2,3,4].copyWithin(-10,2) [0] === 2');
    arktest.assertEQ(r2[1], 3, '[0,1,2,3,4].copyWithin(-10,2) [1] === 3');
    arktest.assertEQ(r2[2], 4, '[0,1,2,3,4].copyWithin(-10,2) [2] === 4');
    arktest.assertEQ(r2[3], 3, '[0,1,2,3,4].copyWithin(-10,2) [3] === 3');
    arktest.assertEQ(r2[4], 4, '[0,1,2,3,4].copyWithin(-10,2) [4] === 4');
}