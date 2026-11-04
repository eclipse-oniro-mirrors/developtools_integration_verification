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

// arktsid: array_constructor
// description: Array constructor creates arrays with specified elements

function main(): void {
    let a: int[] = [];
    arktest.assertEQ(a.length, 0, 'empty array length');

    let b: int[] = [0, 1, 0, 1];
    arktest.assertEQ(b.length, 4, 'length');
    arktest.assertEQ(b[0], 0, 'b[0]');
    arktest.assertEQ(b[1], 1, 'b[1]');
    arktest.assertEQ(b[2], 0, 'b[2]');
    arktest.assertEQ(b[3], 1, 'b[3]');

    let c: int[] = [1, 2, 3];
    arktest.assertEQ(c.length, 3, 'literal length');
    arktest.assertEQ(c[0], 1, 'c[0]');
    arktest.assertEQ(c[1], 2, 'c[1]');
    arktest.assertEQ(c[2], 3, 'c[2]');
}