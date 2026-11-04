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

// arktsid: splice_deletes_all_elements
// description: length = deleteCount > start = 0

function main(): void {
    let x: int[] = [0, 1, 2, 3];
    let arr: int[] = x.splice(0, 4);
    arktest.assertEQ(arr.length, 4, 'arr.length === 4');
    arktest.assertEQ(arr[0], 0, 'arr[0] === 0');
    arktest.assertEQ(arr[1], 1, 'arr[1] === 1');
    arktest.assertEQ(arr[2], 2, 'arr[2] === 2');
    arktest.assertEQ(arr[3], 3, 'arr[3] === 3');
    arktest.assertEQ(x.length, 0, 'x.length === 0');
}