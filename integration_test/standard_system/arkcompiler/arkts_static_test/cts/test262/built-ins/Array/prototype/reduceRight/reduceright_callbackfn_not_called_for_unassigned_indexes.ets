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

// arktsid: reduceright_callbackfn_not_called_for_unassigned_indexes
// description: Array.prototype.reduceRight - callbackfn not called for indexes never been assigned values
// Conversion notes:
//  - The JS array new Array(10) has holes at indexes 2..9; only arr[0] and arr[1]
//    (explicitly assigned undefined) are visited, so the callback runs once and the
//    result is undefined. ArkTS arrays are dense and cannot carry holes, so the array
//    is shortened to the two explicitly-assigned slots [undefined, undefined]; the
//    observable assertions (callCnt == 1 and result == undefined) are preserved.

function main(): void {
    let callCnt: int = 0;
    let arr: (number | undefined)[] = [undefined, undefined];
    let result: number | undefined = arr.reduceRight(
        (prev: number | undefined, cur: number | undefined): number | undefined => {
        callCnt = callCnt + 1;
        return cur;
    });
    arktest.assertEQ(callCnt, 1, 'callCnt');
    arktest.assertTrue(result === undefined, 'result is undefined');
}