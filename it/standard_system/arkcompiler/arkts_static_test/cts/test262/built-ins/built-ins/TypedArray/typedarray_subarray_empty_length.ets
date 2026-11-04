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

// arktsid: typedarray_subarray_empty_length
// description: subarray with an empty range returns a zero-length view
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 42; taI32[1] = 43; taI32[2] = 44; taI32[3] = 45;
    arktest.assertEQ(taI32.subarray(4).length, 0, 'Int32Array subarray(4) empty');
    arktest.assertEQ(taI32.subarray(2, 2).length, 0, 'Int32Array subarray(2,2) empty');
    let taU8 = new Uint8Array(4);
    taU8[0] = 42; taU8[1] = 43; taU8[2] = 44; taU8[3] = 45;
    arktest.assertEQ(taU8.subarray(4).length, 0, 'Uint8Array subarray(4) empty');
    arktest.assertEQ(taU8.subarray(2, 2).length, 0, 'Uint8Array subarray(2,2) empty');
    let taF64 = new Float64Array(4);
    taF64[0] = 42; taF64[1] = 43; taF64[2] = 44; taF64[3] = 45;
    arktest.assertEQ(taF64.subarray(4).length, 0, 'Float64Array subarray(4) empty');
    arktest.assertEQ(taF64.subarray(2, 2).length, 0, 'Float64Array subarray(2,2) empty');
}