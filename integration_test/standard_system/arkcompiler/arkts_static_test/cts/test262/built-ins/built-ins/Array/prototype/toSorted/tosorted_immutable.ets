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

// arktsid: tosorted_immutable
// description: toSorted does not mutate its this value and returns a new array
// Conversion notes:
//  - The default (string code-unit) sort of [2,0,1] yields [0,1,2].

function main(): void {
    let arr: int[] = [2, 0, 1];
    let result: int[] = arr.toSorted();

    // Original is not mutated.
    arktest.assertEQ(arr.length, 3, 'original length');
    arktest.assertEQ(arr[0], 2, 'original[0]');
    arktest.assertEQ(arr[1], 0, 'original[1]');
    arktest.assertEQ(arr[2], 1, 'original[2]');

    // Result is a new sorted array.
    arktest.assertTrue(result !== arr, 'result is a new array');
    arktest.assertEQ(result.length, 3, 'result length');
    arktest.assertEQ(result[0], 0, 'result[0]');
    arktest.assertEQ(result[1], 1, 'result[1]');
    arktest.assertEQ(result[2], 2, 'result[2]');
}