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

// arktsid: typedarray_entries_return_itor
// description: entries returns an iterator of [index, value] pairs
// Conversion notes: representative TypedArray types unrolled; for-of used to avoid nullish tuple indexing.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 7; taI32[1] = 42; taI32[2] = 64;
    let firstIdxI32: int = -1;
    let cntI32: int = 0;
    for (let pairI32 of taI32.entries()) {
        if (cntI32 == 0) { firstIdxI32 = pairI32[0]; }
        cntI32++;
    }
    arktest.assertEQ(cntI32, 3, 'Int32Array entries count');
    arktest.assertEQ(firstIdxI32, 0, 'Int32Array entries first idx');
    let taU8 = new Uint8Array(3);
    taU8[0] = 7; taU8[1] = 42; taU8[2] = 64;
    let firstIdxU8: int = -1;
    let cntU8: int = 0;
    for (let pairU8 of taU8.entries()) {
        if (cntU8 == 0) { firstIdxU8 = pairU8[0]; }
        cntU8++;
    }
    arktest.assertEQ(cntU8, 3, 'Uint8Array entries count');
    arktest.assertEQ(firstIdxU8, 0, 'Uint8Array entries first idx');
    let taF64 = new Float64Array(3);
    taF64[0] = 7; taF64[1] = 42; taF64[2] = 64;
    let firstIdxF64: int = -1;
    let cntF64: int = 0;
    for (let pairF64 of taF64.entries()) {
        if (cntF64 == 0) { firstIdxF64 = pairF64[0]; }
        cntF64++;
    }
    arktest.assertEQ(cntF64, 3, 'Float64Array entries count');
    arktest.assertEQ(firstIdxF64, 0, 'Float64Array entries first idx');
}