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

// arktsid: foreach_does_not_visit_after_length_decrease
// description: Array.prototype.forEach doesn't visit deleted elements when Array.length is decreased
// Conversion notes:
//  - The callback truncates arr.length = 3 on the first invocation. The stdlib forEach
//    re-checks i < actualLength on every step (length is read live), so indices 3..4 are
//    removed and never visited; callCnt stays 3.
//  - Mutable callCnt counter declared as int and incremented inside the callback.
//  - Integer literals [1..5] typed as Array<int>.

function main(): void {
    let callCnt: int = 0;
    let arr: int[] = [1, 2, 3, 4, 5];
    arr.forEach((_v: int): void => {
        arr.length = 3;
        callCnt++;
    });
    arktest.assertEQ(callCnt, 3, 'callCnt');
}