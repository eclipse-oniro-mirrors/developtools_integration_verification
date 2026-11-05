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

// arktsid: foreach_deleted_elements_not_visited
// description: Array.prototype.forEach doesn't visit deleted elements in array after the call
// Conversion notes:
//  - ArkTS has no `delete` operator and no sparse holes; arr.splice(3, 1) inside the callback
//    removes the element at index 3 and shrinks the array, so that index is never visited and
//    callCnt is 4, the same observable result as the original delete-based test.
//  - Mutable callCnt counter declared as int and incremented inside the callback.
//  - Integer literals [1..5] typed as Array<int>.

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [1, 2, 3, 4, 5];
    arr.forEach((_v: int): void => {
        if (callCnt === 0) {
            arr.splice(3, 1);
        }
        callCnt++;
    });
    arktest.assertEQ(callCnt, 4, 'callCnt');
}