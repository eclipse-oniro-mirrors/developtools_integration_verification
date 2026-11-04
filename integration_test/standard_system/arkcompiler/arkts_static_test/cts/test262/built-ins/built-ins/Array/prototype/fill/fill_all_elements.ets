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

// arktsid: fill_all_elements
// description: Fill all elements with a value using default start and end

function main(): void {
    let empty: int[] = [];
    let emptyResult: int[] = empty.fill(8);
    arktest.assertEQ(emptyResult.length, 0, '[].fill(8) length === 0');

    let a: int[] = [0, 0, 0];
    let r: int[] = a.fill(8);
    arktest.assertEQ(r.length, 3, '[0,0,0].fill(8) length === 3');
    arktest.assertEQ(r[0], 8, '[0,0,0].fill(8) [0] === 8');
    arktest.assertEQ(r[1], 8, '[0,0,0].fill(8) [1] === 8');
    arktest.assertEQ(r[2], 8, '[0,0,0].fill(8) [2] === 8');
}