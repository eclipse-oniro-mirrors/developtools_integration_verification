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

// arktsid: filter_returns_new_array_of_matches
// description: Array.prototype.filter returns new Array with length equal to number of true returned by callbackfn
// Conversion notes:
//  - Named callbackfn(val, idx, obj) became a typed arrow predicate. The
//    original `if (val % 2) return true; else return false;` was written as
//    `return v % 2 !== 0;` because ArkTS requires an explicit boolean
//    expression (an int condition is not implicitly coerced).

function main(): void {
    let srcArr: int[] = [1, 2, 3, 4, 5];
    let resArr: int[] = srcArr.filter((v: int): boolean => { return v % 2 !== 0; });
    arktest.assertEQ(resArr.length, 3, 'resArr.length');
    arktest.assertEQ(resArr[0], 1, 'resArr[0]');
    arktest.assertEQ(resArr[1], 3, 'resArr[1]');
    arktest.assertEQ(resArr[2], 5, 'resArr[2]');
}