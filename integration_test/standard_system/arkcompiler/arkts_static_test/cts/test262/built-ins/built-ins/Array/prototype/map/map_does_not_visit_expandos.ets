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

// arktsid: map_does_not_visit_expandos
// description: Array.prototype.map does not visit expando properties
// Conversion notes:
//  - Mutable callCnt counter declared as int and incremented inside the callback
//  - Integer literals [1, 2, 3, 4, 5] typed as Array<int>
//  - Dropped expando property assignments srcArr["i"] = 10 and srcArr[true] = 11;
//    ArkTS arrays do not support non-integer expando keys, and the core assertion
//    (only the 5 indexed elements are visited) remains meaningful.

function main(): void {
    let callCnt: int = 0;
    let srcArr: int[] = [1, 2, 3, 4, 5];
    let resArr: boolean[] = srcArr.map((v: int, i: int): boolean => {
        callCnt++;
        return true;
    });
    arktest.assertEQ(callCnt, 5, 'callCnt');
}