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

// arktsid: tospliced_deletecount_clamped
// description: deleteCount is clamped between zero and len - actualStart

function main(): void {
    let r1: int[] = [0, 1, 2, 3, 4, 5].toSpliced(2, -1);
    arktest.assertEQ(r1.length, 6, 'r1 length');
    arktest.assertEQ(r1[0], 0, 'r1[0]');
    arktest.assertEQ(r1[1], 1, 'r1[1]');
    arktest.assertEQ(r1[2], 2, 'r1[2]');
    arktest.assertEQ(r1[3], 3, 'r1[3]');
    arktest.assertEQ(r1[4], 4, 'r1[4]');
    arktest.assertEQ(r1[5], 5, 'r1[5]');

    let r2: int[] = [0, 1, 2, 3, 4, 5].toSpliced(-4, -1);
    arktest.assertEQ(r2.length, 6, 'r2 length');
    arktest.assertEQ(r2[0], 0, 'r2[0]');
    arktest.assertEQ(r2[1], 1, 'r2[1]');
    arktest.assertEQ(r2[2], 2, 'r2[2]');
    arktest.assertEQ(r2[3], 3, 'r2[3]');
    arktest.assertEQ(r2[4], 4, 'r2[4]');
    arktest.assertEQ(r2[5], 5, 'r2[5]');

    let r3: int[] = [0, 1, 2, 3, 4, 5].toSpliced(2, 6);
    arktest.assertEQ(r3.length, 2, 'r3 length');
    arktest.assertEQ(r3[0], 0, 'r3[0]');
    arktest.assertEQ(r3[1], 1, 'r3[1]');

    let r4: int[] = [0, 1, 2, 3, 4, 5].toSpliced(-4, 6);
    arktest.assertEQ(r4.length, 2, 'r4 length');
    arktest.assertEQ(r4[0], 0, 'r4[0]');
    arktest.assertEQ(r4[1], 1, 'r4[1]');
}