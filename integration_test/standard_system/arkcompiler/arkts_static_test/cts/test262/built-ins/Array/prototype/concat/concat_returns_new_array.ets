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

// arktsid: concat_returns_new_array
// description: Checking this algorithm with no items

function main(): void {
    let x: int[] = [0, 1];
    let arr: int[] = x.concat();
    arktest.assertEQ(arr[0], 0, 'The value of arr[0] is expected to be 0');
    arktest.assertEQ(arr[1], 1, 'The value of arr[1] is expected to be 1');
    arktest.assertEQ(arr.length, 2, 'The value of arr.length is expected to be 2');
    arktest.assertNE(arr, x, 'The value of arr is expected to not equal the value of `x`');
}