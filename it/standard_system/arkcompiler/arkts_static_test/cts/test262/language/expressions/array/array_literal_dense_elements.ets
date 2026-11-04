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

// arktsid: array_literal_dense_elements
// description: An array literal with expressions evaluates to an array of the given length and elements

function main(): void {
    let array: number[] = [1, 2, 3, 4, 5];
    arktest.assertEQ(array.length, 5);
    arktest.assertEQ(array[0], 1);
    arktest.assertEQ(array[1], 2);
    arktest.assertEQ(array[2], 3);
    arktest.assertEQ(array[3], 4);
    arktest.assertEQ(array[4], 5);
}
