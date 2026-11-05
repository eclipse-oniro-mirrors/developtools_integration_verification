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

// arktsid: typedarray_slice_same_length
// description: slice with full-range args returns a copy with the same length
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 42; taI32[1] = 43; taI32[2] = 44; taI32[3] = 45;
    let sI32 = taI32.slice(0);
    arktest.assertEQ(sI32.length, 4, 'Int32Array slice(0) length');
    arktest.assertEQ(sI32[0]!.valueOf(), 42, 'Int32Array slice(0) 0');
    let s2I32 = taI32.slice(-4);
    arktest.assertEQ(s2I32.length, 4, 'Int32Array slice(-4) length');
    let taU8 = new Uint8Array(4);
    taU8[0] = 42; taU8[1] = 43; taU8[2] = 44; taU8[3] = 45;
    let sU8 = taU8.slice(0);
    arktest.assertEQ(sU8.length, 4, 'Uint8Array slice(0) length');
    arktest.assertEQ(sU8[0]!.valueOf(), 42, 'Uint8Array slice(0) 0');
    let s2U8 = taU8.slice(-4);
    arktest.assertEQ(s2U8.length, 4, 'Uint8Array slice(-4) length');
    let taF64 = new Float64Array(4);
    taF64[0] = 42; taF64[1] = 43; taF64[2] = 44; taF64[3] = 45;
    let sF64 = taF64.slice(0);
    arktest.assertEQ(sF64.length, 4, 'Float64Array slice(0) length');
    arktest.assertEQ(sF64[0]!.valueOf(), 42, 'Float64Array slice(0) 0');
    let s2F64 = taF64.slice(-4);
    arktest.assertEQ(s2F64.length, 4, 'Float64Array slice(-4) length');
}