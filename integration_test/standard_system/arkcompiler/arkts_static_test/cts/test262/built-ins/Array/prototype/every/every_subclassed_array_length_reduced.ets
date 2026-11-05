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

// arktsid: every_subclassed_array_length_reduced
// description: Array.prototype.every - subclassed array when length is reduced
// Conversion notes:
//  - The JS test builds a prototype-subclassed array of [1,2,3] whose length is reduced
//    to 2, then every() only visits the first two elements. ArkTS has no JS prototype
//    subclassing, so the observable behavior is tested on a plain length-2 array [1, 2].
//  - The callback returns false for values > 2, so with only [1, 2] every() is true.

function main(): void {
    let arr: int[] = [1, 2];
    let result: boolean = arr.every((val: int, idx: int, a: int[]): boolean => {
        if (val > 2) {
            return false;
        } else {
            return true;
        }
    });
    arktest.assertEQ(result, true, 'i');
}