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

// arktsid: tospliced_immutable
// description: toSpliced does not mutate its this value and returns a new array
// Conversion notes:
//  - Inserted items are passed as trailing variadic arguments, matching the
//    ArkTS toSpliced(start, delete, ...items) signature.

function main(): void {
    let arr: int[] = [2, 0, 1];

    let r1: int[] = arr.toSpliced(0, 0, -1);
    // Original is not mutated.
    arktest.assertEQ(arr.length, 3, 'original length');
    arktest.assertEQ(arr[0], 2, 'original[0]');
    arktest.assertEQ(arr[1], 0, 'original[1]');
    arktest.assertEQ(arr[2], 1, 'original[2]');
    // Result inserts -1 at index 0 and deletes nothing.
    arktest.assertTrue(r1 !== arr, 'r1 is a new array');
    arktest.assertEQ(r1.length, 4, 'r1 length');
    arktest.assertEQ(r1[0], -1, 'r1[0]');
    arktest.assertEQ(r1[1], 2, 'r1[1]');
    arktest.assertEQ(r1[2], 0, 'r1[2]');
    arktest.assertEQ(r1[3], 1, 'r1[3]');

    let r2: int[] = arr.toSpliced(0, 1, -1);
    arktest.assertTrue(r2 !== arr, 'r2 is a new array');
    arktest.assertEQ(r2.length, 3, 'r2 length');
    arktest.assertEQ(r2[0], -1, 'r2[0]');
    arktest.assertEQ(r2[1], 0, 'r2[1]');
    arktest.assertEQ(r2[2], 1, 'r2[2]');
}