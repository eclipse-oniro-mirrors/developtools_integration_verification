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

// arktsid: indices_array_matched
// description: The properties of the "indices" array correspond to the start/end indices of the same values in the
// match.
// Conversion notes: d flag match indices; exec() returns RegExpExecArray whose .indices is Array<Array<int>>.
//   compareArray replaced with element-wise assertions; input.slice extracts the [start, end) range.

function main(): void {
    let input: String = 'abcd';
    let match: RegExpExecArray | null = new RegExp('b(c)', 'd').exec(input);
    if (match == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    let indices: int[][] = match.indices;

    // `indices` has the same length as match
    arktest.assertEQ(indices.length, match.length, 'indices length equals match length');

    // The first element of `indices` contains the start/end indices of the match
    arktest.assertEQ(indices[0][0], 1, 'indices[0][0]');
    arktest.assertEQ(indices[0][1], 3, 'indices[0][1]');
    arktest.assertEQ(input.slice(indices[0][0], indices[0][1]), match[0], 'match slice equals match[0]');

    // The second element of `indices` contains the start/end indices of the first capture
    arktest.assertEQ(indices[1][0], 2, 'indices[1][0]');
    arktest.assertEQ(indices[1][1], 3, 'indices[1][1]');
    arktest.assertEQ(input.slice(indices[1][0], indices[1][1]), match[1], 'capture slice equals match[1]');
}