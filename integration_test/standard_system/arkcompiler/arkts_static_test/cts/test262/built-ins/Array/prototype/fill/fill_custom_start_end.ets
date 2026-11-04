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

// arktsid: fill_custom_start_end
// description: Fill elements with custom start and end indexes

function main(): void {
    let a1: int[] = [0, 0, 0];
    let r1: int[] = a1.fill(8, 1, 2);
    arktest.assertEQ(r1.length, 3, '[0,0,0].fill(8,1,2) length === 3');
    arktest.assertEQ(r1[0], 0, '[0,0,0].fill(8,1,2) [0] === 0');
    arktest.assertEQ(r1[1], 8, '[0,0,0].fill(8,1,2) [1] === 8');
    arktest.assertEQ(r1[2], 0, '[0,0,0].fill(8,1,2) [2] === 0');

    let a2: int[] = [0, 0, 0, 0, 0];
    let r2: int[] = a2.fill(8, -3, 4);
    arktest.assertEQ(r2.length, 5, '[0,0,0,0,0].fill(8,-3,4) length === 5');
    arktest.assertEQ(r2[0], 0, '[0,0,0,0,0].fill(8,-3,4) [0] === 0');
    arktest.assertEQ(r2[1], 0, '[0,0,0,0,0].fill(8,-3,4) [1] === 0');
    arktest.assertEQ(r2[2], 8, '[0,0,0,0,0].fill(8,-3,4) [2] === 8');
    arktest.assertEQ(r2[3], 8, '[0,0,0,0,0].fill(8,-3,4) [3] === 8');
    arktest.assertEQ(r2[4], 0, '[0,0,0,0,0].fill(8,-3,4) [4] === 0');

    let a3: int[] = [0, 0, 0, 0, 0];
    let r3: int[] = a3.fill(8, -2, -1);
    arktest.assertEQ(r3.length, 5, '[0,0,0,0,0].fill(8,-2,-1) length === 5');
    arktest.assertEQ(r3[0], 0, '[0,0,0,0,0].fill(8,-2,-1) [0] === 0');
    arktest.assertEQ(r3[1], 0, '[0,0,0,0,0].fill(8,-2,-1) [1] === 0');
    arktest.assertEQ(r3[2], 0, '[0,0,0,0,0].fill(8,-2,-1) [2] === 0');
    arktest.assertEQ(r3[3], 8, '[0,0,0,0,0].fill(8,-2,-1) [3] === 8');
    arktest.assertEQ(r3[4], 0, '[0,0,0,0,0].fill(8,-2,-1) [4] === 0');

    let a4: int[] = [0, 0, 0, 0, 0];
    let r4: int[] = a4.fill(8, -1, -3);
    arktest.assertEQ(r4.length, 5, '[0,0,0,0,0].fill(8,-1,-3) length === 5');
    arktest.assertEQ(r4[0], 0, '[0,0,0,0,0].fill(8,-1,-3) [0] === 0');
    arktest.assertEQ(r4[1], 0, '[0,0,0,0,0].fill(8,-1,-3) [1] === 0');
    arktest.assertEQ(r4[2], 0, '[0,0,0,0,0].fill(8,-1,-3) [2] === 0');
    arktest.assertEQ(r4[3], 0, '[0,0,0,0,0].fill(8,-1,-3) [3] === 0');
    arktest.assertEQ(r4[4], 0, '[0,0,0,0,0].fill(8,-1,-3) [4] === 0');
}