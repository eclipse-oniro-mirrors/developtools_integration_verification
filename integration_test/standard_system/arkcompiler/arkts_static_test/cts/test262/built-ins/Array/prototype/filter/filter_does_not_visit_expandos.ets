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

// arktsid: filter_does_not_visit_expandos
// description: Array.prototype.filter doesn't visit expandos
// Conversion notes:
//  - Dropped expando property assignments srcArr["i"] = 10 and srcArr[true] =
//    11: ArkTS arrays are typed and cannot carry named/string-keyed expandos,
//    so these have no equivalent and are irrelevant to the callback count.
//  - The original callback returned undefined (relying on JS ToBoolean coercion
//    to false); replaced with an explicit `return false` to preserve the
//    "no elements kept" behavior. The asserted behavior (callCnt === 5, i.e.
//    the predicate is invoked exactly once per integer index) is unaffected.

function main(): void {
    let callCnt: int = 0;
    let srcArr: int[] = [1, 2, 3, 4, 5];
    srcArr.filter((_v: int): boolean => {
        callCnt++;
        return false;
    });
    arktest.assertEQ(callCnt, 5, 'callCnt');
}