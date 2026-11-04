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

// arktsid: filter_callback_three_formal_params
// description: Array.prototype.filter - callbackfn is called with 3 formal parameter
// Conversion notes:
//  - Callback-params test (obj[idx] === val): migrated as a typed arrow
//    predicate (v: int, i: int, a: Array<int>) => boolean. The third parameter
//    (the array) is used to confirm the value/index/array triple is
//    self-consistent. No this/arguments used in source.

function main(): void {
    let newArr: int[] = [11].filter((v: int, i: int, a: int[]): boolean => { return v > 10 && a[i] === v; });
    arktest.assertEQ(newArr.length, 1, 'newArr.length');
    arktest.assertEQ(newArr[0], 11, 'newArr[0]');
}