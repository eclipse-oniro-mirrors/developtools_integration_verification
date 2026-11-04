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

// arktsid: unshift_prepends_many_args
// description: The arguments are prepended to the start of the array, such that their
//   order within the array is the same as the order in which they appear in the
//   argument list; unshift returns the new length.
// Conversion notes:
//  - Source unshifts mixed types (true, +Infinity, "NaN", "1", -1) onto [0]. ArkTS
//    arrays are statically typed and cannot mix booleans, numbers and strings, so the
//    values are homogenized to strings. The prepend order, positions and returned
//    length (6) are preserved exactly.

function main(): void {
    let x: string[] = ['0'];
    arktest.assertEQ(x.length, 1, 'x.length === 1');

    let unshift: number = x.unshift('true', 'Infinity', 'NaN', '1', '-1');
    arktest.assertEQ(unshift, 6, 'x.unshift(...) === 6');
    arktest.assertEQ(x.length, 6, 'x.length === 6');
    arktest.assertEQ(x[0], 'true', 'x[0] === true (as string)');
    arktest.assertEQ(x[1], 'Infinity', 'x[1] === +Infinity (as string)');
    arktest.assertEQ(x[2], 'NaN', 'x[2] === "NaN"');
    arktest.assertEQ(x[3], '1', 'x[3] === "1"');
    arktest.assertEQ(x[4], '-1', 'x[4] === -1 (as string)');
    arktest.assertEQ(x[5], '0', 'x[5] === 0 (as string)');
}