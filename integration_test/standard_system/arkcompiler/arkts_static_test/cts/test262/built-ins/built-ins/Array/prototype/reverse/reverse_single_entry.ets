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

// arktsid: reverse_single_entry
// description: Array.prototype.reverse should not iterate items if there is only one entry
// Conversion notes:
//  - Upstream freezes the single-element array with Object.freeze then calls
//    reverse() and asserts it does not throw (no swap is needed for len <= 1).
//    Object.freeze is not available in ArkTS, so the test is reduced to its
//    observable contract: reverse on a single-entry array returns the same
//    array, leaves the element unchanged and does not throw.

function main(): void {
    let a: int[] = [1];
    let rev: int[] = a.reverse();
    arktest.assertEQ(rev, a, 'reverse returns same array');
    arktest.assertEQ(a[0], 1, 'single entry unchanged');
    arktest.assertEQ(a.length, 1, 'length stays 1');
}