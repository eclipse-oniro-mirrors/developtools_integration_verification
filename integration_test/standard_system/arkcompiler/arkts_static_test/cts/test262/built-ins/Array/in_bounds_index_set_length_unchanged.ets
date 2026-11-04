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

// arktsid: in_bounds_index_set_length_unchanged
// description: Setting an in-bounds array index (length === 100, P in [0, 98, 99]) does not change the length
// Conversion notes:
//  - JS `Array(100)` builds a sparse length-100 array; ArkTS equivalent is
//    Array.create(100, 0) (the length-only constructor is private).

function main(): void {
    let x: int[] = Array.create(100, 0);
    x[0] = 1;
    arktest.assertEQ(x.length, 100, 'x.length after x[0] = 1');

    x[98] = 1;
    arktest.assertEQ(x.length, 100, 'x.length after x[98] = 1');

    x[99] = 1;
    arktest.assertEQ(x.length, 100, 'x.length after x[99] = 1');
}