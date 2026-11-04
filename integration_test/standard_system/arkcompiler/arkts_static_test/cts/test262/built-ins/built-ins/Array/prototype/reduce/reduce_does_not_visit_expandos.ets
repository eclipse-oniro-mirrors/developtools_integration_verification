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

// arktsid: reduce_does_not_visit_expandos
// description: Array.prototype.reduce doesn't visit expandos
// Conversion notes:
//  - ArkTS typed Array<string> cannot carry expando properties, so the
//    `srcArr["i"] = 10` and `srcArr[true] = 11` assignments are dropped (they
//    would never be visited by integer-index iteration anyway). The test then
//    verifies the callback is invoked length-1 (4) times for a 5-element array
//    with no initialValue.
//  - The JS callback returned curVal; kept as-is. U == T == string.

function main(): void {
    let callCnt: int = 0;
    let srcArr: string[] = ['1', '2', '3', '4', '5'];
    let r: string = srcArr.reduce((prev: string, cur: string): string => {
        callCnt = callCnt + 1;
        return cur;
    });
    arktest.assertEQ(callCnt, 4, 'callCnt');
}