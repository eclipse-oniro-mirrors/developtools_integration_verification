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

// arktsid: out_of_bounds_index_set_empty_throws_rangeerror
// description: Adding an element at an array index of an empty array (JS grows the length to index+1) throws RangeError
// in ArkTS
// Conversion notes:
//  - JS `var x = []; x[0] = 1` grows the empty array to length 1, then
//    x[1] = 1 -> length 2, x[9] = 1 -> length 10. ArkTS arrays are
//    fixed-size and an out-of-bounds write on an empty array throws
//    RangeError. The behavior difference is captured as a positive throw test.

function main(): void {
    let x: int[] = [];

    arktest.expectThrow((): void => {
        x[0] = 1;
    }, (e: Error): boolean => e instanceof RangeError);
}