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

// arktsid: sort_undefined_and_value
// description: With the default SortCompare operator, an undefined element returns 1
//   (j undefined) or -1 (k undefined), so undefined moves to the end of the array.
// Conversion notes:
//  - Source new Array(undefined, 1) / new Array(1, undefined) map 1:1 to an
//    Array<number | undefined> in ArkTS. Default sort puts undefined at the end.

function main(): void {
    let x: (number | undefined)[] = [undefined, 1];
    x.sort();
    arktest.assertEQ(x.length, 2, 'case 1: x.length === 2');
    arktest.assertTrue(x[0] === 1, 'case 1: x[0] === 1');
    arktest.assertTrue(x[1] === undefined, 'case 1: x[1] === undefined');

    let y: (number | undefined)[] = [1, undefined];
    y.sort();
    arktest.assertEQ(y.length, 2, 'case 2: y.length === 2');
    arktest.assertTrue(y[0] === 1, 'case 2: y[0] === 1');
    arktest.assertTrue(y[1] === undefined, 'case 2: y[1] === undefined');
}