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

// arktsid: every_callback_value_matches_array_index
// description: Array.prototype.every - callbackfn called with correct parameters (value === array[index])
// Conversion notes:
//  - Original callback returned true when obj[Idx] === val and undefined otherwise;
//    converted to return the boolean expression a[i] === v directly so the predicate
//    always returns a boolean. The condition holds for every element, so every returns true.
//  - Integer literals [0..9] typed as Array<int>

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    let result: boolean = arr.every((v: int, i: int, a: int[]): boolean => {
        return a[i] === v;
    });
    arktest.assertEQ(result, true, 'arr.every(callbackfn)');
}