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

// arktsid: with_index_out_of_range_throws_rangeerror
// description: Array.prototype.with with index >= length throws RangeError
// Conversion notes:
//  - JS `[0,1,2].with(3, 7)` throws RangeError (actualIndex >= len). ArkTS
//    `with(index: int, value: T)` throws RangeError("Invalid index") for
//    index >= actualLength. The `2**53` and `Infinity` index cases are
//    compile-negative (Long/double -> int), covered elsewhere.

function main(): void {
    let a: int[] = [0, 1, 2];

    arktest.expectThrow((): void => {
        a.with(3, 7);
    }, (e: Error): boolean => e.name === 'RangeError');

    arktest.expectThrow((): void => {
        a.with(10, 7);
    }, (e: Error): boolean => e.name === 'RangeError');
}