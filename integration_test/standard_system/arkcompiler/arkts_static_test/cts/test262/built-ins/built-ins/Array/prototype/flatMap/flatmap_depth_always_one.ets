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

// arktsid: flatmap_depth_always_one
// description: flatMap flattens the callback return value by exactly one level, not more
// Conversion notes:
//  - Case 1: callback returns Array<int>, so U=int; return value flattened one level -> result Array<int> [1,2,2,4].
// - Case 2: callback returns Array<Array<int>>, so U=Array<int>; only the outer level is flattened, leaving inner
// arrays
// - Case 2: callback returns Array<Array<int>>, so U=Array<int>; only the outer level is flattened, leaving inner
// arrays
// [2],[4],[6] as elements. Result typed Array<Array<int>> to force U=Array<int>.

function main(): void {
    // Case 1: callback returns an array; flatMap flattens it exactly one level.
    let a1: int[] = [1, 2];
    let r1: int[] = a1.flatMap<int>((e: int): int[] => [e, e * 2]);
    arktest.assertEQ(r1.length, 4, '[1,2].flatMap: r1.length === 4');
    arktest.assertEQ(r1[0], 1, '[1,2].flatMap: r1[0] === 1');
    arktest.assertEQ(r1[1], 2, '[1,2].flatMap: r1[1] === 2');
    arktest.assertEQ(r1[2], 2, '[1,2].flatMap: r1[2] === 2');
    arktest.assertEQ(r1[3], 4, '[1,2].flatMap: r1[3] === 4');

    // Case 2: callback returns a nested array; only one level is flattened,
    // so the inner arrays survive as elements of the result.
    let a2: int[] = [1, 2, 3];
    let r2: int[][] = a2.flatMap<int[]>((ele: int): int[][] => [[ele * 2]]);
    arktest.assertEQ(r2.length, 3, '[1,2,3].flatMap: r2.length === 3');
    // r2[0] === [2]
    arktest.assertEQ(r2[0].length, 1, 'r2[0].length === 1');
    arktest.assertEQ(r2[0][0], 2, 'r2[0][0] === 2');
    // r2[1] === [4]
    arktest.assertEQ(r2[1].length, 1, 'r2[1].length === 1');
    arktest.assertEQ(r2[1][0], 4, 'r2[1][0] === 4');
    // r2[2] === [6]
    arktest.assertEQ(r2[2].length, 1, 'r2[2].length === 1');
    arktest.assertEQ(r2[2][0], 6, 'r2[2][0] === 6');
}