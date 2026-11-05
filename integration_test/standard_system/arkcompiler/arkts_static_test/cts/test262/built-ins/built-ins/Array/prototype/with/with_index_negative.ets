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

// arktsid: with_index_negative
// description: with adds length to a negative index
// Conversion notes:
//  - The -0 case is written as 0: for an int, -0 is not distinct from 0 and is
//    not treated as negative, so with(0, 4) replaces index 0.

function main(): void {
    let arr: int[] = [0, 1, 2];

    let r1: int[] = arr.with(-1, 4);
    arktest.assertEQ(r1.length, 3, 'r1 length');
    arktest.assertEQ(r1[0], 0, 'r1[0]');
    arktest.assertEQ(r1[1], 1, 'r1[1]');
    arktest.assertEQ(r1[2], 4, 'r1[2]');

    let r2: int[] = arr.with(-3, 4);
    arktest.assertEQ(r2.length, 3, 'r2 length');
    arktest.assertEQ(r2[0], 4, 'r2[0]');
    arktest.assertEQ(r2[1], 1, 'r2[1]');
    arktest.assertEQ(r2[2], 2, 'r2[2]');

    // -0 is not negative; for an int it equals 0.
    let r3: int[] = arr.with(0, 4);
    arktest.assertEQ(r3.length, 3, 'r3 length');
    arktest.assertEQ(r3[0], 4, 'r3[0]');
    arktest.assertEQ(r3[1], 1, 'r3[1]');
    arktest.assertEQ(r3[2], 2, 'r3[2]');
}