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

// arktsid: sort_both_elements_undefined
// description: If this object does not have a property named by ToString(j) nor
//   ToString(k), SortCompare returns +0; sorting [undefined, undefined] keeps both.
// Conversion notes:
//  - Source used new Array(2) (two holes). ArkTS arrays are dense and cannot carry
//    holes, so the array is expressed as [undefined, undefined]; a missing element
//    reads as undefined and default sort keeps both slots in place (length 2).

function main(): void {
    let x: (number | undefined)[] = [undefined, undefined];
    x.sort();
    arktest.assertEQ(x.length, 2, 'x.length === 2');
    arktest.assertTrue(x[0] === undefined, 'x[0] === undefined');
    arktest.assertTrue(x[1] === undefined, 'x[1] === undefined');
}