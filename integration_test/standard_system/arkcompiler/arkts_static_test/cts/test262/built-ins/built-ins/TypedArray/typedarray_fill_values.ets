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

// arktsid: typedarray_fill_values
// description: fill(value) writes value to every element
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32.fill(8);
    arktest.assertEQ(taI32[0], 8, 'Int32Array fill 0');
    arktest.assertEQ(taI32[2], 8, 'Int32Array fill 2');
    let eI32 = new Int32Array(0);
    eI32.fill(8);
    arktest.assertEQ(eI32.length, 0, 'Int32Array fill empty');
    let taU8 = new Uint8Array(3);
    taU8.fill(8);
    arktest.assertEQ(taU8[0], 8, 'Uint8Array fill 0');
    arktest.assertEQ(taU8[2], 8, 'Uint8Array fill 2');
    let eU8 = new Uint8Array(0);
    eU8.fill(8);
    arktest.assertEQ(eU8.length, 0, 'Uint8Array fill empty');
    let taF64 = new Float64Array(3);
    taF64.fill(8);
    arktest.assertEQ(taF64[0], 8, 'Float64Array fill 0');
    arktest.assertEQ(taF64[2], 8, 'Float64Array fill 2');
    let eF64 = new Float64Array(0);
    eF64.fill(8);
    arktest.assertEQ(eF64.length, 0, 'Float64Array fill empty');
}