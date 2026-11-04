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

// arktsid: copywithin_negative_target
// description: Set values with negative target argument.

function main(): void {
    let a1: int[] = [0, 1, 2, 3];
    let r1: int[] = a1.copyWithin(-1, 0);
    arktest.assertEQ(r1.length, 4, '[0,1,2,3].copyWithin(-1,0) length === 4');
    arktest.assertEQ(r1[0], 0, '[0,1,2,3].copyWithin(-1,0) [0] === 0');
    arktest.assertEQ(r1[1], 1, '[0,1,2,3].copyWithin(-1,0) [1] === 1');
    arktest.assertEQ(r1[2], 2, '[0,1,2,3].copyWithin(-1,0) [2] === 2');
    arktest.assertEQ(r1[3], 0, '[0,1,2,3].copyWithin(-1,0) [3] === 0');

    let a2: int[] = [0, 1, 2, 3, 4];
    let r2: int[] = a2.copyWithin(-2, 2);
    arktest.assertEQ(r2.length, 5, '[0,1,2,3,4].copyWithin(-2,2) length === 5');
    arktest.assertEQ(r2[0], 0, '[0,1,2,3,4].copyWithin(-2,2) [0] === 0');
    arktest.assertEQ(r2[1], 1, '[0,1,2,3,4].copyWithin(-2,2) [1] === 1');
    arktest.assertEQ(r2[2], 2, '[0,1,2,3,4].copyWithin(-2,2) [2] === 2');
    arktest.assertEQ(r2[3], 2, '[0,1,2,3,4].copyWithin(-2,2) [3] === 2');
    arktest.assertEQ(r2[4], 3, '[0,1,2,3,4].copyWithin(-2,2) [4] === 3');

    let a3: int[] = [0, 1, 2, 3];
    let r3: int[] = a3.copyWithin(-1, 2);
    arktest.assertEQ(r3.length, 4, '[0,1,2,3].copyWithin(-1,2) length === 4');
    arktest.assertEQ(r3[0], 0, '[0,1,2,3].copyWithin(-1,2) [0] === 0');
    arktest.assertEQ(r3[1], 1, '[0,1,2,3].copyWithin(-1,2) [1] === 1');
    arktest.assertEQ(r3[2], 2, '[0,1,2,3].copyWithin(-1,2) [2] === 2');
    arktest.assertEQ(r3[3], 2, '[0,1,2,3].copyWithin(-1,2) [3] === 2');
}