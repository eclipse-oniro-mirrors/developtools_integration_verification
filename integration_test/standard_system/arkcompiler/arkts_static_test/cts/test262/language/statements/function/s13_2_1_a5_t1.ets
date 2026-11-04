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
// arktsid: s13_2_1_a5_t1
// description: Sorting with closure

let arr: number[] = [4, 3, 2, 1, 4, 3, 2, 1, 4, 3, 2, 1];

arr.sort((x: number, y: number): int => {
    if (x > y) { return -1; }
    if (x < y) { return 1; }
    return 0;
});

function main(): void {
    arktest.assertEQ(arr.length, 12);
    arktest.assertEQ(arr[0], 4);
    arktest.assertEQ(arr[1], 4);
    arktest.assertEQ(arr[4], 3);
    arktest.assertEQ(arr[8], 2);
}