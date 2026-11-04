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

// arktsid: typedarray_sort_sorted_values
// description: sort with no comparator sorts elements in numeric order
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 4; taI32[1] = 3; taI32[2] = 2; taI32[3] = 1;
    taI32.sort();
    arktest.assertEQ(taI32[0]!.valueOf(), 1, 'Int32Array sort 0');
    arktest.assertEQ(taI32[3]!.valueOf(), 4, 'Int32Array sort 3');
    let taU8 = new Uint8Array(4);
    taU8[0] = 4; taU8[1] = 3; taU8[2] = 2; taU8[3] = 1;
    taU8.sort();
    arktest.assertEQ(taU8[0]!.valueOf(), 1, 'Uint8Array sort 0');
    arktest.assertEQ(taU8[3]!.valueOf(), 4, 'Uint8Array sort 3');
    let taF64 = new Float64Array(4);
    taF64[0] = 4; taF64[1] = 3; taF64[2] = 2; taF64[3] = 1;
    taF64.sort();
    arktest.assertEQ(taF64[0]!.valueOf(), 1, 'Float64Array sort 0');
    arktest.assertEQ(taF64[3]!.valueOf(), 4, 'Float64Array sort 3');
}