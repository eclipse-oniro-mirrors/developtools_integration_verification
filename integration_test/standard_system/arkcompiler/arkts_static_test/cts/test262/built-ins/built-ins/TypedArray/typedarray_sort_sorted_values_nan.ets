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

// arktsid: typedarray_sort_sorted_values_nan
// description: sort puts NaN at the end on float typed arrays
// Conversion notes: float TypedArray types only; NaN compared via self-inequality.

function main(): void {
    let taF32 = new Float32Array(4);
    taF32[0] = 3; taF32[1] = NaN; taF32[2] = 1; taF32[3] = 2;
    taF32.sort();
    arktest.assertEQ(taF32[0]!.valueOf(), 1, 'Float32Array sort-nan 0');
    arktest.assertEQ(taF32[1]!.valueOf(), 2, 'Float32Array sort-nan 1');
    arktest.assertTrue(taF32[3]!.valueOf() !== taF32[3]!.valueOf(), 'Float32Array sort-nan last is NaN');
    let taF64 = new Float64Array(4);
    taF64[0] = 3; taF64[1] = NaN; taF64[2] = 1; taF64[3] = 2;
    taF64.sort();
    arktest.assertEQ(taF64[0]!.valueOf(), 1, 'Float64Array sort-nan 0');
    arktest.assertEQ(taF64[1]!.valueOf(), 2, 'Float64Array sort-nan 1');
    arktest.assertTrue(taF64[3]!.valueOf() !== taF64[3]!.valueOf(), 'Float64Array sort-nan last is NaN');
}