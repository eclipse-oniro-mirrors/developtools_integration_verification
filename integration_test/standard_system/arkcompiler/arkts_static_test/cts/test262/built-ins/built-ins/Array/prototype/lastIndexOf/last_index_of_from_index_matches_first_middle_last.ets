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

// arktsid: last_index_of_from_index_matches_first_middle_last
// description: Array.prototype.lastIndexOf - match on the first element, a middle element and the last element when
// 'fromIndex' is passed

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4];
    arktest.assertEQ(arr.lastIndexOf(0, 0), 0, '[0, 1, 2, 3, 4].lastIndexOf(0, 0)');
    arktest.assertEQ(arr.lastIndexOf(0, 2), 0, '[0, 1, 2, 3, 4].lastIndexOf(0, 2)');
    arktest.assertEQ(arr.lastIndexOf(2, 2), 2, '[0, 1, 2, 3, 4].lastIndexOf(2, 2)');
    arktest.assertEQ(arr.lastIndexOf(2, 4), 2, '[0, 1, 2, 3, 4].lastIndexOf(2, 4)');
    arktest.assertEQ(arr.lastIndexOf(4, 4), 4, '[0, 1, 2, 3, 4].lastIndexOf(4, 4)');
}