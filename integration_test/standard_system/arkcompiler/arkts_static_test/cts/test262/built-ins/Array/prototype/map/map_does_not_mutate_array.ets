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

// arktsid: map_does_not_mutate_array
// description: Array.prototype.map does not mutate the array on which it is called
// Conversion notes:
//  - Integer literals [1, 2, 3, 4, 5] typed as Array<int>
//  - The return value of map is captured as Array<boolean> to satisfy ArkTS typing

function main(): void {
    let srcArr: int[] = [1, 2, 3, 4, 5];
    let resArr: boolean[] = srcArr.map((v: int): boolean => { return true; });
    arktest.assertEQ(srcArr[0], 1, 'srcArr[0]');
    arktest.assertEQ(srcArr[1], 2, 'srcArr[1]');
    arktest.assertEQ(srcArr[2], 3, 'srcArr[2]');
    arktest.assertEQ(srcArr[3], 4, 'srcArr[3]');
    arktest.assertEQ(srcArr[4], 5, 'srcArr[4]');
}