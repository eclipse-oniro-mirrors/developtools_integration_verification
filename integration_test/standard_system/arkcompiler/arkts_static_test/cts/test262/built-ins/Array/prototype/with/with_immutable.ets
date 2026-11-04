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

// arktsid: with_immutable
// description: with does not mutate its this value and returns a new array

function main(): void {
    let arr: int[] = [0, 1, 2];

    let r1: int[] = arr.with(1, 3);
    // Original is not mutated.
    arktest.assertEQ(arr.length, 3, 'original length');
    arktest.assertEQ(arr[0], 0, 'original[0]');
    arktest.assertEQ(arr[1], 1, 'original[1]');
    arktest.assertEQ(arr[2], 2, 'original[2]');
    // Result replaces index 1 with 3.
    arktest.assertTrue(r1 !== arr, 'r1 is a new array');
    arktest.assertEQ(r1.length, 3, 'r1 length');
    arktest.assertEQ(r1[0], 0, 'r1[0]');
    arktest.assertEQ(r1[1], 3, 'r1[1]');
    arktest.assertEQ(r1[2], 2, 'r1[2]');

    let r2: int[] = arr.with(1, 1);
    arktest.assertTrue(r2 !== arr, 'r2 is a new array');
}