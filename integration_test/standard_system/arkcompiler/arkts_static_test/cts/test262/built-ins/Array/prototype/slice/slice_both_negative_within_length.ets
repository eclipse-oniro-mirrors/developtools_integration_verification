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

// arktsid: slice_both_negative_within_length
// description: -length < start < end < 0

function main(): void {
    let x: int[] = [0, 1, 2, 3, 4];
    let arr: int[] = x.slice(-3, -1);
    arktest.assertEQ(arr.length, 2, 'x.slice(-3,-1): arr.length === 2');
    arktest.assertEQ(arr[0], 2, 'x.slice(-3,-1): arr[0] === 2');
    arktest.assertEQ(arr[1], 3, 'x.slice(-3,-1): arr[1] === 3');
}