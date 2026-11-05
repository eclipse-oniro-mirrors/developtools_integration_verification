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

// arktsid: typedarray_set_typedarray_arg_set_values_same_buffer_same_type
// description: set from a view of the same buffer clones the source so overlapping writes are safe
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let sI32 = new Int32Array(4);
    sI32[0] = 1; sI32[1] = 2; sI32[2] = 3; sI32[3] = 4;
    let srcI32 = sI32.subarray(0, 2);
    sI32.set(srcI32, 2);
    arktest.assertEQ(sI32[2]!.valueOf(), 1, 'Int32Array same-buf set offset 2 -> 0');
    arktest.assertEQ(sI32[3]!.valueOf(), 2, 'Int32Array same-buf set offset 2 -> 1');
    let s2I32 = new Int32Array(4);
    s2I32[0] = 1; s2I32[1] = 2; s2I32[2] = 3; s2I32[3] = 4;
    let src2I32 = s2I32.subarray(0, 2);
    s2I32.set(src2I32, 1);
    arktest.assertEQ(s2I32[1]!.valueOf(), 1, 'Int32Array same-buf overlap set offset 1 -> 0');
    arktest.assertEQ(s2I32[2]!.valueOf(), 2, 'Int32Array same-buf overlap set offset 1 -> 1 (src cloned)');
    let sU8 = new Uint8Array(4);
    sU8[0] = 1; sU8[1] = 2; sU8[2] = 3; sU8[3] = 4;
    let srcU8 = sU8.subarray(0, 2);
    sU8.set(srcU8, 2);
    arktest.assertEQ(sU8[2]!.valueOf(), 1, 'Uint8Array same-buf set offset 2 -> 0');
    arktest.assertEQ(sU8[3]!.valueOf(), 2, 'Uint8Array same-buf set offset 2 -> 1');
    let s2U8 = new Uint8Array(4);
    s2U8[0] = 1; s2U8[1] = 2; s2U8[2] = 3; s2U8[3] = 4;
    let src2U8 = s2U8.subarray(0, 2);
    s2U8.set(src2U8, 1);
    arktest.assertEQ(s2U8[1]!.valueOf(), 1, 'Uint8Array same-buf overlap set offset 1 -> 0');
    arktest.assertEQ(s2U8[2]!.valueOf(), 2, 'Uint8Array same-buf overlap set offset 1 -> 1 (src cloned)');
    let sF64 = new Float64Array(4);
    sF64[0] = 1; sF64[1] = 2; sF64[2] = 3; sF64[3] = 4;
    let srcF64 = sF64.subarray(0, 2);
    sF64.set(srcF64, 2);
    arktest.assertEQ(sF64[2]!.valueOf(), 1, 'Float64Array same-buf set offset 2 -> 0');
    arktest.assertEQ(sF64[3]!.valueOf(), 2, 'Float64Array same-buf set offset 2 -> 1');
    let s2F64 = new Float64Array(4);
    s2F64[0] = 1; s2F64[1] = 2; s2F64[2] = 3; s2F64[3] = 4;
    let src2F64 = s2F64.subarray(0, 2);
    s2F64.set(src2F64, 1);
    arktest.assertEQ(s2F64[1]!.valueOf(), 1, 'Float64Array same-buf overlap set offset 1 -> 0');
    arktest.assertEQ(s2F64[2]!.valueOf(), 2, 'Float64Array same-buf overlap set offset 1 -> 1 (src cloned)');
}