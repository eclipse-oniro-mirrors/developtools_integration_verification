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

// arktsid: filter_callbackfn_return_zero
// description: Array.prototype.filter - return value of callbackfn is a number (value is 0)
// Conversion notes:
//  - JS callback returns 0 which is falsy; ArkTS filter predicate requires boolean, so mapped to false.
//  - accessed flag set inside the callback to prove the callback was invoked.

function main(): void {
    let accessed: boolean = false;
    let newArr: int[] = [11].filter((val: int, idx: int, array: int[]): boolean => {
        accessed = true;
        return false;
    });
    arktest.assertEQ(newArr.length, 0, 'newArr.length');
    arktest.assertTrue(accessed, 'accessed !== true');
}