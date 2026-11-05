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

// arktsid: copywithin_non_negative_out_of_bounds_target_and_start
// description: Max values of target and start positions are this.length.

function main(): void {
    let a1: int[] = [0, 1, 2, 3, 4, 5];
    let r1: int[] = a1.copyWithin(6, 0);
    arktest.assertEQ(r1.length, 6, '[0,1,2,3,4,5].copyWithin(6,0) length === 6');
    arktest.assertEQ(r1[0], 0, '[0,1,2,3,4,5].copyWithin(6,0) [0] === 0');
    arktest.assertEQ(r1[1], 1, '[0,1,2,3,4,5].copyWithin(6,0) [1] === 1');
    arktest.assertEQ(r1[2], 2, '[0,1,2,3,4,5].copyWithin(6,0) [2] === 2');
    arktest.assertEQ(r1[3], 3, '[0,1,2,3,4,5].copyWithin(6,0) [3] === 3');
    arktest.assertEQ(r1[4], 4, '[0,1,2,3,4,5].copyWithin(6,0) [4] === 4');
    arktest.assertEQ(r1[5], 5, '[0,1,2,3,4,5].copyWithin(6,0) [5] === 5');

    let a2: int[] = [0, 1, 2, 3, 4, 5];
    let r2: int[] = a2.copyWithin(7, 0);
    arktest.assertEQ(r2.length, 6, '[0,1,2,3,4,5].copyWithin(7,0) length === 6');
    arktest.assertEQ(r2[0], 0, '[0,1,2,3,4,5].copyWithin(7,0) [0] === 0');
    arktest.assertEQ(r2[1], 1, '[0,1,2,3,4,5].copyWithin(7,0) [1] === 1');
    arktest.assertEQ(r2[2], 2, '[0,1,2,3,4,5].copyWithin(7,0) [2] === 2');
    arktest.assertEQ(r2[3], 3, '[0,1,2,3,4,5].copyWithin(7,0) [3] === 3');
    arktest.assertEQ(r2[4], 4, '[0,1,2,3,4,5].copyWithin(7,0) [4] === 4');
    arktest.assertEQ(r2[5], 5, '[0,1,2,3,4,5].copyWithin(7,0) [5] === 5');

    let a3: int[] = [0, 1, 2, 3, 4, 5];
    let r3: int[] = a3.copyWithin(6, 2);
    arktest.assertEQ(r3.length, 6, '[0,1,2,3,4,5].copyWithin(6,2) length === 6');
    arktest.assertEQ(r3[0], 0, '[0,1,2,3,4,5].copyWithin(6,2) [0] === 0');
    arktest.assertEQ(r3[1], 1, '[0,1,2,3,4,5].copyWithin(6,2) [1] === 1');
    arktest.assertEQ(r3[2], 2, '[0,1,2,3,4,5].copyWithin(6,2) [2] === 2');
    arktest.assertEQ(r3[3], 3, '[0,1,2,3,4,5].copyWithin(6,2) [3] === 3');
    arktest.assertEQ(r3[4], 4, '[0,1,2,3,4,5].copyWithin(6,2) [4] === 4');
    arktest.assertEQ(r3[5], 5, '[0,1,2,3,4,5].copyWithin(6,2) [5] === 5');

    let a4: int[] = [0, 1, 2, 3, 4, 5];
    let r4: int[] = a4.copyWithin(7, 2);
    arktest.assertEQ(r4.length, 6, '[0,1,2,3,4,5].copyWithin(7,2) length === 6');
    arktest.assertEQ(r4[0], 0, '[0,1,2,3,4,5].copyWithin(7,2) [0] === 0');
    arktest.assertEQ(r4[1], 1, '[0,1,2,3,4,5].copyWithin(7,2) [1] === 1');
    arktest.assertEQ(r4[2], 2, '[0,1,2,3,4,5].copyWithin(7,2) [2] === 2');
    arktest.assertEQ(r4[3], 3, '[0,1,2,3,4,5].copyWithin(7,2) [3] === 3');
    arktest.assertEQ(r4[4], 4, '[0,1,2,3,4,5].copyWithin(7,2) [4] === 4');
    arktest.assertEQ(r4[5], 5, '[0,1,2,3,4,5].copyWithin(7,2) [5] === 5');

    let a5: int[] = [0, 1, 2, 3, 4, 5];
    let r5: int[] = a5.copyWithin(0, 6);
    arktest.assertEQ(r5.length, 6, '[0,1,2,3,4,5].copyWithin(0,6) length === 6');
    arktest.assertEQ(r5[0], 0, '[0,1,2,3,4,5].copyWithin(0,6) [0] === 0');
    arktest.assertEQ(r5[1], 1, '[0,1,2,3,4,5].copyWithin(0,6) [1] === 1');
    arktest.assertEQ(r5[2], 2, '[0,1,2,3,4,5].copyWithin(0,6) [2] === 2');
    arktest.assertEQ(r5[3], 3, '[0,1,2,3,4,5].copyWithin(0,6) [3] === 3');
    arktest.assertEQ(r5[4], 4, '[0,1,2,3,4,5].copyWithin(0,6) [4] === 4');
    arktest.assertEQ(r5[5], 5, '[0,1,2,3,4,5].copyWithin(0,6) [5] === 5');

    let a6: int[] = [0, 1, 2, 3, 4, 5];
    let r6: int[] = a6.copyWithin(0, 7);
    arktest.assertEQ(r6.length, 6, '[0,1,2,3,4,5].copyWithin(0,7) length === 6');
    arktest.assertEQ(r6[0], 0, '[0,1,2,3,4,5].copyWithin(0,7) [0] === 0');
    arktest.assertEQ(r6[1], 1, '[0,1,2,3,4,5].copyWithin(0,7) [1] === 1');
    arktest.assertEQ(r6[2], 2, '[0,1,2,3,4,5].copyWithin(0,7) [2] === 2');
    arktest.assertEQ(r6[3], 3, '[0,1,2,3,4,5].copyWithin(0,7) [3] === 3');
    arktest.assertEQ(r6[4], 4, '[0,1,2,3,4,5].copyWithin(0,7) [4] === 4');
    arktest.assertEQ(r6[5], 5, '[0,1,2,3,4,5].copyWithin(0,7) [5] === 5');

    let a7: int[] = [0, 1, 2, 3, 4, 5];
    let r7: int[] = a7.copyWithin(2, 6);
    arktest.assertEQ(r7.length, 6, '[0,1,2,3,4,5].copyWithin(2,6) length === 6');
    arktest.assertEQ(r7[0], 0, '[0,1,2,3,4,5].copyWithin(2,6) [0] === 0');
    arktest.assertEQ(r7[1], 1, '[0,1,2,3,4,5].copyWithin(2,6) [1] === 1');
    arktest.assertEQ(r7[2], 2, '[0,1,2,3,4,5].copyWithin(2,6) [2] === 2');
    arktest.assertEQ(r7[3], 3, '[0,1,2,3,4,5].copyWithin(2,6) [3] === 3');
    arktest.assertEQ(r7[4], 4, '[0,1,2,3,4,5].copyWithin(2,6) [4] === 4');
    arktest.assertEQ(r7[5], 5, '[0,1,2,3,4,5].copyWithin(2,6) [5] === 5');

    let a8: int[] = [0, 1, 2, 3, 4, 5];
    let r8: int[] = a8.copyWithin(1, 7);
    arktest.assertEQ(r8.length, 6, '[0,1,2,3,4,5].copyWithin(1,7) length === 6');
    arktest.assertEQ(r8[0], 0, '[0,1,2,3,4,5].copyWithin(1,7) [0] === 0');
    arktest.assertEQ(r8[1], 1, '[0,1,2,3,4,5].copyWithin(1,7) [1] === 1');
    arktest.assertEQ(r8[2], 2, '[0,1,2,3,4,5].copyWithin(1,7) [2] === 2');
    arktest.assertEQ(r8[3], 3, '[0,1,2,3,4,5].copyWithin(1,7) [3] === 3');
    arktest.assertEQ(r8[4], 4, '[0,1,2,3,4,5].copyWithin(1,7) [4] === 4');
    arktest.assertEQ(r8[5], 5, '[0,1,2,3,4,5].copyWithin(1,7) [5] === 5');

    let a9: int[] = [0, 1, 2, 3, 4, 5];
    let r9: int[] = a9.copyWithin(6, 6);
    arktest.assertEQ(r9.length, 6, '[0,1,2,3,4,5].copyWithin(6,6) length === 6');
    arktest.assertEQ(r9[0], 0, '[0,1,2,3,4,5].copyWithin(6,6) [0] === 0');
    arktest.assertEQ(r9[1], 1, '[0,1,2,3,4,5].copyWithin(6,6) [1] === 1');
    arktest.assertEQ(r9[2], 2, '[0,1,2,3,4,5].copyWithin(6,6) [2] === 2');
    arktest.assertEQ(r9[3], 3, '[0,1,2,3,4,5].copyWithin(6,6) [3] === 3');
    arktest.assertEQ(r9[4], 4, '[0,1,2,3,4,5].copyWithin(6,6) [4] === 4');
    arktest.assertEQ(r9[5], 5, '[0,1,2,3,4,5].copyWithin(6,6) [5] === 5');

    let a10: int[] = [0, 1, 2, 3, 4, 5];
    let r10: int[] = a10.copyWithin(10, 10);
    arktest.assertEQ(r10.length, 6, '[0,1,2,3,4,5].copyWithin(10,10) length === 6');
    arktest.assertEQ(r10[0], 0, '[0,1,2,3,4,5].copyWithin(10,10) [0] === 0');
    arktest.assertEQ(r10[1], 1, '[0,1,2,3,4,5].copyWithin(10,10) [1] === 1');
    arktest.assertEQ(r10[2], 2, '[0,1,2,3,4,5].copyWithin(10,10) [2] === 2');
    arktest.assertEQ(r10[3], 3, '[0,1,2,3,4,5].copyWithin(10,10) [3] === 3');
    arktest.assertEQ(r10[4], 4, '[0,1,2,3,4,5].copyWithin(10,10) [4] === 4');
    arktest.assertEQ(r10[5], 5, '[0,1,2,3,4,5].copyWithin(10,10) [5] === 5');
}