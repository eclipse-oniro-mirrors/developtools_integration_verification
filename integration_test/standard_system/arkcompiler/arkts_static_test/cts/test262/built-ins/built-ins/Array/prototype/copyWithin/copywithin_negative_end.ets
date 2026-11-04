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

// arktsid: copywithin_negative_end
// description: Set values with negative end argument.

function main(): void {
    let a1: int[] = [0, 1, 2, 3];
    let r1: int[] = a1.copyWithin(0, 1, -1);
    arktest.assertEQ(r1.length, 4, '[0,1,2,3].copyWithin(0,1,-1) length === 4');
    arktest.assertEQ(r1[0], 1, '[0,1,2,3].copyWithin(0,1,-1) [0] === 1');
    arktest.assertEQ(r1[1], 2, '[0,1,2,3].copyWithin(0,1,-1) [1] === 2');
    arktest.assertEQ(r1[2], 2, '[0,1,2,3].copyWithin(0,1,-1) [2] === 2');
    arktest.assertEQ(r1[3], 3, '[0,1,2,3].copyWithin(0,1,-1) [3] === 3');

    let a2: int[] = [0, 1, 2, 3, 4];
    let r2: int[] = a2.copyWithin(2, 0, -1);
    arktest.assertEQ(r2.length, 5, '[0,1,2,3,4].copyWithin(2,0,-1) length === 5');
    arktest.assertEQ(r2[0], 0, '[0,1,2,3,4].copyWithin(2,0,-1) [0] === 0');
    arktest.assertEQ(r2[1], 1, '[0,1,2,3,4].copyWithin(2,0,-1) [1] === 1');
    arktest.assertEQ(r2[2], 0, '[0,1,2,3,4].copyWithin(2,0,-1) [2] === 0');
    arktest.assertEQ(r2[3], 1, '[0,1,2,3,4].copyWithin(2,0,-1) [3] === 1');
    arktest.assertEQ(r2[4], 2, '[0,1,2,3,4].copyWithin(2,0,-1) [4] === 2');

    let a3: int[] = [0, 1, 2, 3, 4];
    let r3: int[] = a3.copyWithin(1, 2, -2);
    arktest.assertEQ(r3.length, 5, '[0,1,2,3,4].copyWithin(1,2,-2) length === 5');
    arktest.assertEQ(r3[0], 0, '[0,1,2,3,4].copyWithin(1,2,-2) [0] === 0');
    arktest.assertEQ(r3[1], 2, '[0,1,2,3,4].copyWithin(1,2,-2) [1] === 2');
    arktest.assertEQ(r3[2], 2, '[0,1,2,3,4].copyWithin(1,2,-2) [2] === 2');
    arktest.assertEQ(r3[3], 3, '[0,1,2,3,4].copyWithin(1,2,-2) [3] === 3');
    arktest.assertEQ(r3[4], 4, '[0,1,2,3,4].copyWithin(1,2,-2) [4] === 4');

    let a4: int[] = [0, 1, 2, 3];
    let r4: int[] = a4.copyWithin(0, -2, -1);
    arktest.assertEQ(r4.length, 4, '[0,1,2,3].copyWithin(0,-2,-1) length === 4');
    arktest.assertEQ(r4[0], 2, '[0,1,2,3].copyWithin(0,-2,-1) [0] === 2');
    arktest.assertEQ(r4[1], 1, '[0,1,2,3].copyWithin(0,-2,-1) [1] === 1');
    arktest.assertEQ(r4[2], 2, '[0,1,2,3].copyWithin(0,-2,-1) [2] === 2');
    arktest.assertEQ(r4[3], 3, '[0,1,2,3].copyWithin(0,-2,-1) [3] === 3');

    let a5: int[] = [0, 1, 2, 3, 4];
    let r5: int[] = a5.copyWithin(2, -2, -1);
    arktest.assertEQ(r5.length, 5, '[0,1,2,3,4].copyWithin(2,-2,-1) length === 5');
    arktest.assertEQ(r5[0], 0, '[0,1,2,3,4].copyWithin(2,-2,-1) [0] === 0');
    arktest.assertEQ(r5[1], 1, '[0,1,2,3,4].copyWithin(2,-2,-1) [1] === 1');
    arktest.assertEQ(r5[2], 3, '[0,1,2,3,4].copyWithin(2,-2,-1) [2] === 3');
    arktest.assertEQ(r5[3], 3, '[0,1,2,3,4].copyWithin(2,-2,-1) [3] === 3');
    arktest.assertEQ(r5[4], 4, '[0,1,2,3,4].copyWithin(2,-2,-1) [4] === 4');

    let a6: int[] = [0, 1, 2, 3];
    let r6: int[] = a6.copyWithin(-3, -2, -1);
    arktest.assertEQ(r6.length, 4, '[0,1,2,3].copyWithin(-3,-2,-1) length === 4');
    arktest.assertEQ(r6[0], 0, '[0,1,2,3].copyWithin(-3,-2,-1) [0] === 0');
    arktest.assertEQ(r6[1], 2, '[0,1,2,3].copyWithin(-3,-2,-1) [1] === 2');
    arktest.assertEQ(r6[2], 2, '[0,1,2,3].copyWithin(-3,-2,-1) [2] === 2');
    arktest.assertEQ(r6[3], 3, '[0,1,2,3].copyWithin(-3,-2,-1) [3] === 3');

    let a7: int[] = [0, 1, 2, 3, 4];
    let r7: int[] = a7.copyWithin(-2, -3, -1);
    arktest.assertEQ(r7.length, 5, '[0,1,2,3,4].copyWithin(-2,-3,-1) length === 5');
    arktest.assertEQ(r7[0], 0, '[0,1,2,3,4].copyWithin(-2,-3,-1) [0] === 0');
    arktest.assertEQ(r7[1], 1, '[0,1,2,3,4].copyWithin(-2,-3,-1) [1] === 1');
    arktest.assertEQ(r7[2], 2, '[0,1,2,3,4].copyWithin(-2,-3,-1) [2] === 2');
    arktest.assertEQ(r7[3], 2, '[0,1,2,3,4].copyWithin(-2,-3,-1) [3] === 2');
    arktest.assertEQ(r7[4], 3, '[0,1,2,3,4].copyWithin(-2,-3,-1) [4] === 3');

    let a8: int[] = [0, 1, 2, 3, 4];
    let r8: int[] = a8.copyWithin(-5, -2, -1);
    arktest.assertEQ(r8.length, 5, '[0,1,2,3,4].copyWithin(-5,-2,-1) length === 5');
    arktest.assertEQ(r8[0], 3, '[0,1,2,3,4].copyWithin(-5,-2,-1) [0] === 3');
    arktest.assertEQ(r8[1], 1, '[0,1,2,3,4].copyWithin(-5,-2,-1) [1] === 1');
    arktest.assertEQ(r8[2], 2, '[0,1,2,3,4].copyWithin(-5,-2,-1) [2] === 2');
    arktest.assertEQ(r8[3], 3, '[0,1,2,3,4].copyWithin(-5,-2,-1) [3] === 3');
    arktest.assertEQ(r8[4], 4, '[0,1,2,3,4].copyWithin(-5,-2,-1) [4] === 4');
}