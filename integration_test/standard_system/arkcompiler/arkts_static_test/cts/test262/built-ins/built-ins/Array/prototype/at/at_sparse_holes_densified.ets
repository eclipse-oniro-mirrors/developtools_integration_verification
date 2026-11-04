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

// arktsid: at_sparse_holes_densified
// description: Array.prototype.at returns items at real positions in a sparse array
// Conversion notes: ArkTS arrays have no holes; [0,1,,3,4,,6] densifies to
//   [0,1,0,3,4,0,6]. Only positions with real values are asserted.

function main(): void {
    let a: int[] = [0, 1, 0, 3, 4, 0, 6];

    // Positive indices at real positions
    arktest.assertEQ(a.at(0), 0, 'a.at(0)');
    arktest.assertEQ(a.at(1), 1, 'a.at(1)');
    arktest.assertEQ(a.at(3), 3, 'a.at(3)');
    arktest.assertEQ(a.at(4), 4, 'a.at(4)');
    arktest.assertEQ(a.at(6), 6, 'a.at(6)');

    // Negative indices
    arktest.assertEQ(a.at(-0), 0, 'a.at(-0)');
    arktest.assertEQ(a.at(-1), 6, 'a.at(-1)');
    arktest.assertEQ(a.at(-3), 4, 'a.at(-3)');
    arktest.assertEQ(a.at(-4), 3, 'a.at(-4)');
    arktest.assertEQ(a.at(-6), 1, 'a.at(-6)');
}