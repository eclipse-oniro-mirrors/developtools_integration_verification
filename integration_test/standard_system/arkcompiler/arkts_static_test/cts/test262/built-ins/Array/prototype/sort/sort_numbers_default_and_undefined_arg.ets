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

// arktsid: sort_numbers_default_and_undefined_arg
// description: sort() and sort(undefined) both select the default SortCompare
//   operator, which orders [1, 0] as [0, 1].
// Conversion notes:
//  - The source's sort(undefined) call passes the optional comparator explicitly as
//    undefined, which is equivalent to sort() in ArkTS (the comparator parameter is
//    optional and accepts undefined).

function main(): void {
    let x: int[] = [1, 0];
    x.sort();
    arktest.assertEQ(x.length, 2, 'case 1: x.length === 2');
    arktest.assertEQ(x[0], 0, 'case 1: x[0] === 0');
    arktest.assertEQ(x[1], 1, 'case 1: x[1] === 1');

    let y: int[] = [1, 0];
    y.sort(undefined);
    arktest.assertEQ(y.length, 2, 'case 2: y.length === 2');
    arktest.assertEQ(y[0], 0, 'case 2: y[0] === 0');
    arktest.assertEQ(y[1], 1, 'case 2: y[1] === 1');
}