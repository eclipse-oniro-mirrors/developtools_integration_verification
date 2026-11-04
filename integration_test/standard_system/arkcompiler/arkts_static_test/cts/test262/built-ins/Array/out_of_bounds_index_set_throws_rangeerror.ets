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

// arktsid: out_of_bounds_index_set_throws_rangeerror
// description: Writing at an index at or after the array length (JS auto-grows length to ToUint32(P)+1) throws
// RangeError in ArkTS
// Conversion notes:
//  - JS `var x = Array(100); x[100] = 1` auto-extends the length to 101 and
//    then to 200 on x[199] = 1. ArkTS arrays are fixed-size and an
//    out-of-bounds write throws RangeError. The behavior difference is
//    captured as a positive throw test.

function main(): void {
    let x: int[] = Array.create(100, 0);

    arktest.expectThrow((): void => {
        x[100] = 1;
    }, (e: Error): boolean => e instanceof RangeError);

    arktest.expectThrow((): void => {
        x[199] = 1;
    }, (e: Error): boolean => e instanceof RangeError);
}