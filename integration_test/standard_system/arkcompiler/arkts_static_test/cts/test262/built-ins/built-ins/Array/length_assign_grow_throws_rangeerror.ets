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

// arktsid: length_assign_grow_throws_rangeerror
// description: Assigning a larger Array.length (grow) throws RangeError in ArkTS; shrinking truncates
// Conversion notes:
//  - JS `x.length = 1` on an empty array grows it to length 1, `x[5] = 1` auto-extends
//    it to length 6, then `x.length = 10` grows it to 10. ArkTS arrays are fixed-size:
//    the length setter only shrinks (0 <= len <= actualLength) and throws RangeError when
//    growing or writing out of bounds. The divergence is captured as a positive throw test
//    with a shrink contrast.

function main(): void {
    let x: int[] = [];

    // JS: grows empty array to length 1; ArkTS: grow throws RangeError
    arktest.expectThrow((): void => {
        x.length = 1;
    }, (e: Error): boolean => e.name === 'RangeError');

    // JS: auto-extends length to 6; ArkTS: out-of-bounds index write throws RangeError
    arktest.expectThrow((): void => {
        x[5] = 1;
    }, (e: Error): boolean => e.name === 'RangeError');

    // JS: grows 6 -> 10; ArkTS: grow throws RangeError
    arktest.expectThrow((): void => {
        x.length = 10;
    }, (e: Error): boolean => e.name === 'RangeError');

    // ArkTS does support shrink: length 3 -> 2 truncates and drops the trailing element
    let y: int[] = [1, 2, 3];
    y.length = 2;
    arktest.assertEQ(y.length, 2, 'shrink 3 -> 2');
    arktest.assertEQ(y[0], 1, 'y[0] preserved');
    arktest.assertEQ(y[1], 2, 'y[1] preserved');
    arktest.expectThrow((): void => {
        y[2] = 99;
    }, (e: Error): boolean => e.name === 'RangeError');
}