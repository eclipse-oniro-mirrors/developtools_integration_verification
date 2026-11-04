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

// arktsid: length_assign_shrink_deletes_trailing
// description: Assigning a smaller Array.length shrinks the array and deletes trailing elements
// Conversion notes:
//  - test262 S15.4.5.2_A3_T2 mixes grow (index auto-extend, length=1), shrink
//    (length=4, length=0), undefined-hole reads (x[5] === undefined) and a
//    wrapper-object grow (new Number(6)). Only the shrink dimension is migratable:
//    ArkTS's length setter shrinks (0 <= len <= actualLength) and truncates. The
//    deleted trailing elements become out-of-bounds (RangeError) rather than JS
//    undefined holes; grow/wrapper/hole parts are not captured here.

function main(): void {
    let x: int[] = [1, 2, 3, 4, 5, 6];

    // JS: x.length = 4 deletes x[4], x[5] (undefined holes); ArkTS: truncates physically
    x.length = 4;
    arktest.assertEQ(x.length, 4, 'shrink 6 -> 4');
    arktest.assertEQ(x[0], 1, 'x[0] preserved');
    arktest.assertEQ(x[3], 4, 'x[3] preserved (index < new length)');
    arktest.expectThrow((): void => {
        x[4] = 99;
    }, (e: Error): boolean => e.name === 'RangeError');
    arktest.expectThrow((): void => {
        x[5] = 99;
    }, (e: Error): boolean => e.name === 'RangeError');

    // JS: x.length = 0 clears the array; ArkTS: same, clears all elements
    x.length = 0;
    arktest.assertEQ(x.length, 0, 'shrink to 0 clears');
    arktest.expectThrow((): void => {
        x[0] = 99;
    }, (e: Error): boolean => e.name === 'RangeError');
}