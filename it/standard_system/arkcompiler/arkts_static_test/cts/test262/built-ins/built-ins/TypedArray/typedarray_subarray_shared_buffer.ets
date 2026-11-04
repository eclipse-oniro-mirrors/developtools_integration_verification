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

// arktsid: typedarray_subarray_shared_buffer
// description: subarray returns a view sharing the backing buffer; mutating one affects the other
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3; taI32[3] = 4;
    let sI32 = taI32.subarray(1, 3);
    arktest.assertTrue(sI32.buffer === taI32.buffer, 'Int32Array shared buffer');
    sI32[0] = 99;
    arktest.assertEQ(taI32[1]!.valueOf(), 99, 'Int32Array mutation visible');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3; taU8[3] = 4;
    let sU8 = taU8.subarray(1, 3);
    arktest.assertTrue(sU8.buffer === taU8.buffer, 'Uint8Array shared buffer');
    sU8[0] = 99;
    arktest.assertEQ(taU8[1]!.valueOf(), 99, 'Uint8Array mutation visible');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3; taF64[3] = 4;
    let sF64 = taF64.subarray(1, 3);
    arktest.assertTrue(sF64.buffer === taF64.buffer, 'Float64Array shared buffer');
    sF64[0] = 99;
    arktest.assertEQ(taF64[1]!.valueOf(), 99, 'Float64Array mutation visible');
}