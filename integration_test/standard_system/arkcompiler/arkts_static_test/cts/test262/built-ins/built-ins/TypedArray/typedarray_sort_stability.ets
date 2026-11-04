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

// arktsid: typedarray_sort_stability
// description: sort is stable; equal elements retain their original relative order
// Conversion notes: representative 8-element array with a comparator grouping by 4; ArkTS bitwise OR yields Long so
// .toInt() is used.

function main(): void {
    let ta = new Int32Array(8);
    ta[0] = 7; ta[1] = 6; ta[2] = 5; ta[3] = 4; ta[4] = 3; ta[5] = 2; ta[6] = 1; ta[7] = 0;
    ta.sort((a: number, b: number): int => (a / 4).toInt() - (b / 4).toInt());
    // groups [4..7] and [0..3]; stable sort preserves reversed order within each group
    arktest.assertEQ(ta[0], 3, 'stable 0');
    arktest.assertEQ(ta[1], 2, 'stable 1');
    arktest.assertEQ(ta[2], 1, 'stable 2');
    arktest.assertEQ(ta[3], 0, 'stable 3');
    arktest.assertEQ(ta[4], 7, 'stable 4');
    arktest.assertEQ(ta[5], 6, 'stable 5');
    arktest.assertEQ(ta[6], 5, 'stable 6');
    arktest.assertEQ(ta[7], 4, 'stable 7');
}