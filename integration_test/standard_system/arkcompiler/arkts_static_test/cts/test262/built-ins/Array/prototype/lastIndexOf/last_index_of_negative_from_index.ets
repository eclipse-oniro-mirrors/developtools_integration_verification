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

// arktsid: last_index_of_negative_from_index
// description: Array.prototype.lastIndexOf with negative fromIndex
// Conversion notes:
// - Source used float fromIndex -5.3; changed to int -5 (result identical: abs(-5) > length, so the computed start
// index
// - Source used float fromIndex -5.3; changed to int -5 (result identical: abs(-5) > length, so the computed start
// index
// is negative and the search returns -1). Message string updated to match the int call.
//  - `new Array(1, 2, 3)` replaced with an Array<int> literal.

function main(): void {
    let a: int[] = [1, 2, 3];
    arktest.assertEQ(a.lastIndexOf(2, -2), 1, 'a.lastIndexOf(2,-2)');
    arktest.assertEQ(a.lastIndexOf(2, -3), -1, 'a.lastIndexOf(2,-3)');
    arktest.assertEQ(a.lastIndexOf(1, -5), -1, 'a.lastIndexOf(1,-5)');
}