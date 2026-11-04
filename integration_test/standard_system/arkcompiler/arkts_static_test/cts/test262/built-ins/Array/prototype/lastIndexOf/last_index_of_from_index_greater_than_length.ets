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

// arktsid: last_index_of_from_index_greater_than_length
// description: Array.prototype.lastIndexOf when fromIndex greater than Array.length
// Conversion notes:
// - Source used float fromIndex 5.4 and 3.1; changed to int 5 and 3 (results identical: both >= length so the whole
// array is searched). Message strings updated to match the int calls.
//  - `new Array(1, 2, 3)` replaced with an Array<int> literal.

function main(): void {
    let a: int[] = [1, 2, 3];
    arktest.assertEQ(a.lastIndexOf(3, 5), 2, 'a.lastIndexOf(3,5)');
    arktest.assertEQ(a.lastIndexOf(3, 3), 2, 'a.lastIndexOf(3,3)');
}