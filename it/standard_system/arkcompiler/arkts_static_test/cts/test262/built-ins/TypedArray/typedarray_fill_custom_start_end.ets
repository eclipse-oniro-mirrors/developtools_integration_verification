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

// arktsid: typedarray_fill_custom_start_end
// description: fill(value, start, end) writes to the [start, end) range
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let aI32 = new Int32Array(3);
    aI32.fill(8, 1, 2);
    arktest.assertEQ(aI32[0], 0, 'Int32Array fill start/end 0');
    arktest.assertEQ(aI32[1], 8, 'Int32Array fill start/end 1');
    arktest.assertEQ(aI32[2], 0, 'Int32Array fill start/end 2');
    let aU8 = new Uint8Array(3);
    aU8.fill(8, 1, 2);
    arktest.assertEQ(aU8[0], 0, 'Uint8Array fill start/end 0');
    arktest.assertEQ(aU8[1], 8, 'Uint8Array fill start/end 1');
    arktest.assertEQ(aU8[2], 0, 'Uint8Array fill start/end 2');
    let aF64 = new Float64Array(3);
    aF64.fill(8, 1, 2);
    arktest.assertEQ(aF64[0], 0, 'Float64Array fill start/end 0');
    arktest.assertEQ(aF64[1], 8, 'Float64Array fill start/end 1');
    arktest.assertEQ(aF64[2], 0, 'Float64Array fill start/end 2');
}