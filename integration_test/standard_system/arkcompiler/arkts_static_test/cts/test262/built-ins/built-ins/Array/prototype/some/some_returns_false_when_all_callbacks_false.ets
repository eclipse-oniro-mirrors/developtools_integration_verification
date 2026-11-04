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

// arktsid: some_returns_false_when_all_callbacks_false
// description: Array.prototype.some returns false when all calls to callbackfn return false
// Conversion notes:
//  - Mutable callCnt counter declared as int and incremented inside the callback
//  - Integer literals [0..9] typed as Array<int>

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    let result: boolean = arr.some((v: int, i: int): boolean => {
        callCnt++;
        return false;
    });
    arktest.assertEQ(result, false, 'arr.some(callbackfn)');
    arktest.assertEQ(callCnt, 10, 'callCnt');
}