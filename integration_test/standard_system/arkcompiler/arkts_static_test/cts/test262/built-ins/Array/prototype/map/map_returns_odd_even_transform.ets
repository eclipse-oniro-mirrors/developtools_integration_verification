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

// arktsid: map_returns_odd_even_transform
// description: Array.prototype.map - getOwnPropertyDescriptor(all true) of returned array element; values computed
// by an
// description: Array.prototype.map - getOwnPropertyDescriptor(all true) of returned array element; values computed
// by an
// odd/even callback
// Conversion notes:
//  - Object.getOwnPropertyDescriptor is not available in ArkTS, so the
//    writable/enumerable/configurable-all-true descriptor checks are dropped.
//  - The value-computation semantics of the callback are preserved and asserted
//    on the returned elements (desc.value for index 1 is 3).

function main(): void {
    let srcArr: int[] = [0, 1, 2, 3, 4];
    let resArr: int[] = srcArr.map((val: int): int => {
        if (val % 2 !== 0) {
            return 2 * val + 1;
        }
        return val / 2;
    });
    arktest.assertTrue(resArr.length > 0, 'resArr.length > 0');
    arktest.assertEQ(resArr[0], 0, 'resArr[0]');
    arktest.assertEQ(resArr[1], 3, 'resArr[1]');
    arktest.assertEQ(resArr[2], 1, 'resArr[2]');
    arktest.assertEQ(resArr[3], 7, 'resArr[3]');
    arktest.assertEQ(resArr[4], 2, 'resArr[4]');
}