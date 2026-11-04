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

// arktsid: typedarray_set_array_arg_set_values
// description: set(array, offset) copies array elements into the typed array starting at offset
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3; taI32[3] = 4;
    let srcI32: number[] = [42, 43];
    taI32.set(srcI32, 1);
    arktest.assertEQ(taI32[0]!.valueOf(), 1, 'Int32Array set 0');
    arktest.assertEQ(taI32[1]!.valueOf(), 42, 'Int32Array set 1');
    arktest.assertEQ(taI32[2]!.valueOf(), 43, 'Int32Array set 2');
    arktest.assertEQ(taI32[3]!.valueOf(), 4, 'Int32Array set 3');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3; taU8[3] = 4;
    let srcU8: number[] = [42, 43];
    taU8.set(srcU8, 1);
    arktest.assertEQ(taU8[0]!.valueOf(), 1, 'Uint8Array set 0');
    arktest.assertEQ(taU8[1]!.valueOf(), 42, 'Uint8Array set 1');
    arktest.assertEQ(taU8[2]!.valueOf(), 43, 'Uint8Array set 2');
    arktest.assertEQ(taU8[3]!.valueOf(), 4, 'Uint8Array set 3');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3; taF64[3] = 4;
    let srcF64: number[] = [42, 43];
    taF64.set(srcF64, 1);
    arktest.assertEQ(taF64[0]!.valueOf(), 1, 'Float64Array set 0');
    arktest.assertEQ(taF64[1]!.valueOf(), 42, 'Float64Array set 1');
    arktest.assertEQ(taF64[2]!.valueOf(), 43, 'Float64Array set 2');
    arktest.assertEQ(taF64[3]!.valueOf(), 4, 'Float64Array set 3');
}