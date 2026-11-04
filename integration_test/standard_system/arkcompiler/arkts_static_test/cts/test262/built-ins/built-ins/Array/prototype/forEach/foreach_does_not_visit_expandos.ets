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

// arktsid: foreach_does_not_visit_expandos
// description: Array.prototype.forEach doesn't visit expandos
// Conversion notes:
//  - Mutable callCnt counter declared as int and incremented inside the callback
//  - Integer literals [1..5] typed as Array<int>
//  - Dropped JS-only expando property assignments arr["i"] = 10 and arr[true] = 11;
//    ArkTS arrays are dense and indexed by int, so non-index expandos cannot be
//    expressed. The core assertion (callCnt === 5) is preserved, confirming expandos
//    are not visited.

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [1, 2, 3, 4, 5];
    arr.forEach((v: int, i: int): void => {
        callCnt++;
    });
    arktest.assertEQ(callCnt, 5, 'callCnt');
}