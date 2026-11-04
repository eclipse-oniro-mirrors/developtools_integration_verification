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

// arktsid: typedarray_filter_result_does_not_share_buffer
// description: filter returns a new typed array that does not share the original buffer
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 10; taI32[1] = 41; taI32[2] = 42; taI32[3] = 43;
    let rI32 = taI32.filter((v: number): boolean => v > 40);
    arktest.assertTrue(rI32.buffer !== taI32.buffer, 'Int32Array filter result does not share buffer');
    arktest.assertEQ(rI32.length, 3, 'Int32Array filter length');
    let taU8 = new Uint8Array(4);
    taU8[0] = 10; taU8[1] = 41; taU8[2] = 42; taU8[3] = 43;
    let rU8 = taU8.filter((v: number): boolean => v > 40);
    arktest.assertTrue(rU8.buffer !== taU8.buffer, 'Uint8Array filter result does not share buffer');
    arktest.assertEQ(rU8.length, 3, 'Uint8Array filter length');
    let taF64 = new Float64Array(4);
    taF64[0] = 10; taF64[1] = 41; taF64[2] = 42; taF64[3] = 43;
    let rF64 = taF64.filter((v: number): boolean => v > 40);
    arktest.assertTrue(rF64.buffer !== taF64.buffer, 'Float64Array filter result does not share buffer');
    arktest.assertEQ(rF64.length, 3, 'Float64Array filter length');
}