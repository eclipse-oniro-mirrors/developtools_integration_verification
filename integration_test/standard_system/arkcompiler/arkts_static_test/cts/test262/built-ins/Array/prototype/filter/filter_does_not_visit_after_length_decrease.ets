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

// arktsid: filter_does_not_visit_after_length_decrease
// description: Array.prototype.filter doesn't visit deleted elements when Array.length is decreased
// Conversion notes:
//  - The callback truncates srcArr.length = 2 during iteration. The stdlib filter
//    re-checks i < actualLength on every step (length is read live), so indices
//    2..4 are removed and never visited; the result is [1, 2] (length 2).
//  - Integer literals [1, 2, 3, 4, 6] typed as Array<int>.
//  - Callback rewritten as a typed arrow predicate (val: int, idx: int) => boolean.

function main(): void {
    let srcArr: int[] = [1, 2, 3, 4, 6];
    let resArr: int[] = srcArr.filter((val: int, _idx: int): boolean => {
        srcArr.length = 2;
        return true;
    });
    arktest.assertEQ(resArr.length, 2, 'resArr.length');
}