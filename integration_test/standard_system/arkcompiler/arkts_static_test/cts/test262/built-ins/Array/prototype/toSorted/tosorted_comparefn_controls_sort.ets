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

// arktsid: tosorted_comparefn_controls_sort
// description: toSorted sorts by the provided comparator function

function main(): void {
    let numericCompare: (a: int, b: int) => int = (a: int, b: int) => { return a - b; };
    let reverseNumericCompare: (a: int, b: int) => int = (a: int, b: int) => { return b - a; };

    let a1: int[] = [1, 2, 3, 4].toSorted(numericCompare);
    arktest.assertEQ(a1.length, 4, 'a1 length');
    arktest.assertEQ(a1[0], 1, 'a1[0]');
    arktest.assertEQ(a1[1], 2, 'a1[1]');
    arktest.assertEQ(a1[2], 3, 'a1[2]');
    arktest.assertEQ(a1[3], 4, 'a1[3]');

    let a2: int[] = [4, 3, 2, 1].toSorted(numericCompare);
    arktest.assertEQ(a2.length, 4, 'a2 length');
    arktest.assertEQ(a2[0], 1, 'a2[0]');
    arktest.assertEQ(a2[1], 2, 'a2[1]');
    arktest.assertEQ(a2[2], 3, 'a2[2]');
    arktest.assertEQ(a2[3], 4, 'a2[3]');

    let a3: int[] = [333, 33, 3, 222, 22, 2, 111, 11, 1].toSorted(numericCompare);
    arktest.assertEQ(a3.length, 9, 'a3 length');
    arktest.assertEQ(a3[0], 1, 'a3[0]');
    arktest.assertEQ(a3[1], 2, 'a3[1]');
    arktest.assertEQ(a3[2], 3, 'a3[2]');
    arktest.assertEQ(a3[3], 11, 'a3[3]');
    arktest.assertEQ(a3[4], 22, 'a3[4]');
    arktest.assertEQ(a3[5], 33, 'a3[5]');
    arktest.assertEQ(a3[6], 111, 'a3[6]');
    arktest.assertEQ(a3[7], 222, 'a3[7]');
    arktest.assertEQ(a3[8], 333, 'a3[8]');

    let r1: int[] = [1, 2, 3, 4].toSorted(reverseNumericCompare);
    arktest.assertEQ(r1.length, 4, 'r1 length');
    arktest.assertEQ(r1[0], 4, 'r1[0]');
    arktest.assertEQ(r1[1], 3, 'r1[1]');
    arktest.assertEQ(r1[2], 2, 'r1[2]');
    arktest.assertEQ(r1[3], 1, 'r1[3]');

    let r2: int[] = [4, 3, 2, 1].toSorted(reverseNumericCompare);
    arktest.assertEQ(r2.length, 4, 'r2 length');
    arktest.assertEQ(r2[0], 4, 'r2[0]');
    arktest.assertEQ(r2[1], 3, 'r2[1]');
    arktest.assertEQ(r2[2], 2, 'r2[2]');
    arktest.assertEQ(r2[3], 1, 'r2[3]');

    let r3: int[] = [333, 33, 3, 222, 22, 2, 111, 11, 1].toSorted(reverseNumericCompare);
    arktest.assertEQ(r3.length, 9, 'r3 length');
    arktest.assertEQ(r3[0], 333, 'r3[0]');
    arktest.assertEQ(r3[1], 222, 'r3[1]');
    arktest.assertEQ(r3[2], 111, 'r3[2]');
    arktest.assertEQ(r3[3], 33, 'r3[3]');
    arktest.assertEQ(r3[4], 22, 'r3[4]');
    arktest.assertEQ(r3[5], 11, 'r3[5]');
    arktest.assertEQ(r3[6], 3, 'r3[6]');
    arktest.assertEQ(r3[7], 2, 'r3[7]');
    arktest.assertEQ(r3[8], 1, 'r3[8]');
}