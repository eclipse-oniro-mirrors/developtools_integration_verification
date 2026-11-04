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

// arktsid: with_negative_index_out_of_range_throws_rangeerror
// description: Array.prototype.with with negative index < -length throws RangeError
// Conversion notes:
//  - JS `[0,1,2].with(-3, 7)` is valid (index -3 + len 3 = 0), while
//    `with(-4, 7)` / `with(-10, 7)` throw RangeError (actualIndex < 0). ArkTS
//    matches this. The `-2**53` and `-Infinity` cases are compile-negative.

function main(): void {
    let a: int[] = [0, 1, 2];

    // valid: -3 + 3 = 0 -> replaces index 0
    let r: int[] = a.with(-3, 7);
    arktest.assertEQ(r.length, 3, 'result length unchanged');
    arktest.assertEQ(r[0], 7, 'index 0 replaced');
    arktest.assertEQ(r[1], 1, 'index 1 unchanged');
    arktest.assertEQ(r[2], 2, 'index 2 unchanged');

    // out of range: -4 + 3 = -1 < 0
    arktest.expectThrow((): void => {
        a.with(-4, 7);
    }, (e: Error): boolean => e.name === 'RangeError');

    arktest.expectThrow((): void => {
        a.with(-10, 7);
    }, (e: Error): boolean => e.name === 'RangeError');
}