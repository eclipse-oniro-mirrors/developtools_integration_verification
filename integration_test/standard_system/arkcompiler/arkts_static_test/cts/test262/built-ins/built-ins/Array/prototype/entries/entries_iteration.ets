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

// arktsid: entries_iteration
// description: Array.prototype.entries returns an iterator of [index, value] pairs

function main(): void {
    let array: string[] = ['a', 'b', 'c'];
    let expected: string[] = ['a', 'b', 'c'];
    let i: int = 0;
    for (let e: [int, string] of array.entries()) {
        arktest.assertEQ(e[0], i, 'entry index');
        arktest.assertEQ(e[1], expected[i], 'entry value');
        i++;
    }
    arktest.assertEQ(i, 3, 'iterated all entries');
}