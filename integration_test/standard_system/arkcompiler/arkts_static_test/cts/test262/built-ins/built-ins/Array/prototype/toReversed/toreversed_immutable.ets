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

// arktsid: toreversed_immutable
// description: toReversed does not mutate its this value and returns a new array

function main(): void {
    let arr: int[] = [0, 1, 2];
    let result: int[] = arr.toReversed();

    // Original is not mutated.
    arktest.assertEQ(arr.length, 3, 'original length');
    arktest.assertEQ(arr[0], 0, 'original[0]');
    arktest.assertEQ(arr[1], 1, 'original[1]');
    arktest.assertEQ(arr[2], 2, 'original[2]');

    // Result is a reversed copy.
    arktest.assertEQ(result.length, 3, 'result length');
    arktest.assertEQ(result[0], 2, 'result[0]');
    arktest.assertEQ(result[1], 1, 'result[1]');
    arktest.assertEQ(result[2], 0, 'result[2]');

    // Result is a new array instance.
    arktest.assertTrue(result !== arr, 'result is a new array');
}