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

// arktsid: fill_relative_start
// description: Fill elements with a relative start index

function main(): void {
    let a1: int[] = [0, 0, 0];
    let r1: int[] = a1.fill(8, 1);
    arktest.assertEQ(r1.length, 3, '[0,0,0].fill(8,1) length === 3');
    arktest.assertEQ(r1[0], 0, '[0,0,0].fill(8,1) [0] === 0');
    arktest.assertEQ(r1[1], 8, '[0,0,0].fill(8,1) [1] === 8');
    arktest.assertEQ(r1[2], 8, '[0,0,0].fill(8,1) [2] === 8');

    let a2: int[] = [0, 0, 0];
    let r2: int[] = a2.fill(8, 4);
    arktest.assertEQ(r2.length, 3, '[0,0,0].fill(8,4) length === 3');
    arktest.assertEQ(r2[0], 0, '[0,0,0].fill(8,4) [0] === 0');
    arktest.assertEQ(r2[1], 0, '[0,0,0].fill(8,4) [1] === 0');
    arktest.assertEQ(r2[2], 0, '[0,0,0].fill(8,4) [2] === 0');

    let a3: int[] = [0, 0, 0];
    let r3: int[] = a3.fill(8, -1);
    arktest.assertEQ(r3.length, 3, '[0,0,0].fill(8,-1) length === 3');
    arktest.assertEQ(r3[0], 0, '[0,0,0].fill(8,-1) [0] === 0');
    arktest.assertEQ(r3[1], 0, '[0,0,0].fill(8,-1) [1] === 0');
    arktest.assertEQ(r3[2], 8, '[0,0,0].fill(8,-1) [2] === 8');
}