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

// arktsid: sort_two_undefined_elements
// description: If [[Get]] ToString(j) and [[Get]] ToString(k) are both undefined,
//   SortCompare returns +0 and sorting [undefined, undefined] keeps both in place.
// Conversion notes:
//  - Source new Array(undefined, undefined) is already a dense two-element array of
//    undefined; it maps 1:1 to an Array<number | undefined> in ArkTS.

function main(): void {
    let x: (number | undefined)[] = [undefined, undefined];
    x.sort();
    arktest.assertEQ(x.length, 2, 'x.length === 2');
    arktest.assertTrue(x[0] === undefined, 'x[0] === undefined');
    arktest.assertTrue(x[1] === undefined, 'x[1] === undefined');
}