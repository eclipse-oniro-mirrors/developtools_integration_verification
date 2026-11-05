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

// arktsid: foreach_empty_array_calls_callback_zero_times
// description: Array.prototype.forEach doesn't call callbackfn if 'length' is 0 (empty array)
// Conversion notes:
//  - The original `var i = [].forEach(cb)` assigns the return value, but forEach
//    returns void in ArkTS; the assignment is dropped (the value is never asserted).
//  - The original callback `function cb()` is declared with 0 formal parameters;
//    written as a typed arrow (value: int) => void with an unused value parameter,
//    and a captured counter confirms it is never called on a zero-length array.
//  - Empty array expressed as new Array<int>().

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [];
    arr.forEach((_v: int): void => {
        callCnt++;
    });
    arktest.assertEQ(callCnt, 0, 'callCnt');
}