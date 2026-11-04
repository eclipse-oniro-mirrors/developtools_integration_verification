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

// arktsid: reduce_does_not_mutate_source_array
// description: Array.prototype.reduce doesn't mutate the Array on which it is called
// Conversion notes:
//  - reduce is called for its side-effect-free behavior; afterwards every
//    element of the source array is unchanged.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    let result: int = arr.reduce((prev: int, cur: int, idx: int, a: int[]): int => {
        return 1;
    });
    arktest.assertEQ(arr[0], 1, 'srcArr[0]');
    arktest.assertEQ(arr[1], 2, 'srcArr[1]');
    arktest.assertEQ(arr[2], 3, 'srcArr[2]');
    arktest.assertEQ(arr[3], 4, 'srcArr[3]');
    arktest.assertEQ(arr[4], 5, 'srcArr[4]');
}