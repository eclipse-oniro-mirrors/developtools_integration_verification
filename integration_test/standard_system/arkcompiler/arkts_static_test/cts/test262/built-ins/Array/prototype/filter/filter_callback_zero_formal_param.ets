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

// arktsid: filter_callback_zero_formal_param
// description: Array.prototype.filter - callbackfn is called with 0 formal parameter
// Conversion notes:
//  - The JS callback declared 0 formal parameters; in ArkTS the predicate
//    signature is fixed (value, index, array) => boolean, so the value
//    parameter is present but unused (prefixed with _). filter still invokes
//    the predicate for every element regardless of how many parameters it
//    consumes, so the element is emitted.

function main(): void {
    let newArr: int[] = [11].filter((_v: int): boolean => { return true; });
    arktest.assertEQ(newArr.length, 1, 'newArr.length');
    arktest.assertEQ(newArr[0], 11, 'newArr[0]');
}