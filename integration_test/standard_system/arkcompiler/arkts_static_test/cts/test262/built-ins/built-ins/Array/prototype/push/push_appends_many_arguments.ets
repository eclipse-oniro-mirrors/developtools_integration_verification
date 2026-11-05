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

// arktsid: push_appends_many_arguments
// description: Array.prototype.push appends many arguments to the end of the array, in the order in which they appear,
// and returns the new length
// Conversion notes:
//  - The original Sputnik test pushes mixed-type values (boolean, number, string) into a
//    single array. ArkTS arrays are homogeneous, so numeric values are used to verify the
//    same ordering / new-length semantics of a multi-argument push call.

function main(): void {
    let x: int[] = [0];
    arktest.assertEQ(x.length, 1, 'initial length is 1');

    let pushResult: number = x.push(1, 2, 3, 4, -1);
    arktest.assertEQ(pushResult, 6, 'push returns the new length');
    arktest.assertEQ(x.length, 6, 'x.length');

    arktest.assertEQ(x[0], 0, 'x[0]');
    arktest.assertEQ(x[1], 1, 'x[1]');
    arktest.assertEQ(x[2], 2, 'x[2]');
    arktest.assertEQ(x[3], 3, 'x[3]');
    arktest.assertEQ(x[4], 4, 'x[4]');
    arktest.assertEQ(x[5], -1, 'x[5]');
}