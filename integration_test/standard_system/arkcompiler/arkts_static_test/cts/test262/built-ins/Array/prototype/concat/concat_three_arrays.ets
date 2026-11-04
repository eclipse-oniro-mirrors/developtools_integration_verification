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

// arktsid: concat_three_arrays
// description: Checking this algorithm, items are Array object

function main(): void {
    let x: int[] = [];
    let y: int[] = [0, 1];
    let z: int[] = [2, 3, 4];
    let arr: int[] = x.concat(y, z);
    arktest.assertEQ(arr[0], 0, 'The value of arr[0] is expected to be 0');
    arktest.assertEQ(arr[1], 1, 'The value of arr[1] is expected to be 1');
    arktest.assertEQ(arr[2], 2, 'The value of arr[2] is expected to be 2');
    arktest.assertEQ(arr[3], 3, 'The value of arr[3] is expected to be 3');
    arktest.assertEQ(arr[4], 4, 'The value of arr[4] is expected to be 4');
    arktest.assertEQ(arr.length, 5, 'The value of arr.length is expected to be 5');
}