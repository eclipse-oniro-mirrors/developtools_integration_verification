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

// arktsid: map_source_unmodified_no_side_effects
// description: Array.prototype.map - the source array is unmodified when the callback has no side effects
// Conversion notes:
//  - Mutable called counter declared as int and incremented inside the callback
//  - Integer literals [1, 2, 3, 4] typed as Array<int>; result typed as Array<boolean>
//  - The return value of map is captured as Array<boolean> to satisfy ArkTS typing

function main(): void {
    let called: int = 0;
    let arr: int[] = [1, 2, 3, 4];
    let resArr: boolean[] = arr.map((v: int): boolean => {
        called++;
        return v > 2;
    });
    arktest.assertEQ(arr[0], 1, 'arr[0]');
    arktest.assertEQ(arr[1], 2, 'arr[1]');
    arktest.assertEQ(arr[2], 3, 'arr[2]');
    arktest.assertEQ(arr[3], 4, 'arr[3]');
    arktest.assertEQ(called, 4, 'called');
}