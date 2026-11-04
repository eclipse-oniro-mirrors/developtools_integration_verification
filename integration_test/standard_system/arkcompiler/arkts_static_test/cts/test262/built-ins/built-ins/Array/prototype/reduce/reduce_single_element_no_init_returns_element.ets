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

// arktsid: reduce_single_element_no_init_returns_element
// description: Array.prototype.reduce - callbackfn not called for array with one element
// Conversion notes:
//  - With no initialValue and a single element, reduce returns that element
//    without ever invoking the callback (callCnt stays 0).

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [1];
    let result: int = arr.reduce((prev: int, cur: int, idx: int, a: int[]): int => {
        callCnt++;
        return 2;
    });
    arktest.assertEQ(result, 1, 'arr.reduce(callbackfn)');
    arktest.assertEQ(callCnt, 0, 'callCnt');
}