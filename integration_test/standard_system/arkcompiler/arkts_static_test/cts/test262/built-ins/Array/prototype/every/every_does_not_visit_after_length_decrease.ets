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

// arktsid: every_does_not_visit_after_length_decrease
// description: Array.prototype.every doesn't visit deleted elements when Array.length is decreased
// Conversion notes:
//  - The callback truncates arr.length = 3 during iteration. The stdlib every
//    re-checks i < actualLength on every step (length is read live), so indices
//    3..4 are removed and never visited; every returns true because every
//    visited value satisfies val < 4.
//  - Integer literals [1, 2, 3, 4, 6] typed as Array<int>.
//  - Callback rewritten as a typed arrow predicate (val: int, idx: int) => boolean.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 6];
    let result: boolean = arr.every((val: int, _idx: int): boolean => {
        arr.length = 3;
        if (val < 4) {
            return true;
        } else {
            return false;
        }
    });
    arktest.assertEQ(result, true, 'arr.every(callbackfn)');
}