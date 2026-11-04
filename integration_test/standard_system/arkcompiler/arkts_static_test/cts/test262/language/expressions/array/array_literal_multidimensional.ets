/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: array_literal_multidimensional
// description: Array literals can be nested to create multi-dimensional arrays

function main(): void {
    let array: number[][] = [[1, 2], [3], []];
    arktest.assertEQ(array.length, 3);
    let subarray: number[] = array[0];
    arktest.assertEQ(subarray.length, 2);
    arktest.assertEQ(subarray[0], 1);
    arktest.assertEQ(subarray[1], 2);
    arktest.assertEQ(array[1][0], 3);
    arktest.assertEQ(array[2].length, 0);
}
