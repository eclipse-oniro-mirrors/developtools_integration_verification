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

// arktsid: typedarray_at_returns_undefined_out_of_range
// description: at returns undefined for out-of-range indices and empty arrays
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(2);
    taI32[0] = 1; taI32[1] = 2;
    arktest.assertTrue(taI32.at(2) === undefined, 'Int32Array at length');
    arktest.assertTrue(taI32.at(-3) === undefined, 'Int32Array at -length-1');
    let eI32 = new Int32Array(0);
    arktest.assertTrue(eI32.at(0) === undefined, 'Int32Array empty at(0)');
    let taU8 = new Uint8Array(2);
    taU8[0] = 1; taU8[1] = 2;
    arktest.assertTrue(taU8.at(2) === undefined, 'Uint8Array at length');
    arktest.assertTrue(taU8.at(-3) === undefined, 'Uint8Array at -length-1');
    let eU8 = new Uint8Array(0);
    arktest.assertTrue(eU8.at(0) === undefined, 'Uint8Array empty at(0)');
    let taF64 = new Float64Array(2);
    taF64[0] = 1; taF64[1] = 2;
    arktest.assertTrue(taF64.at(2) === undefined, 'Float64Array at length');
    arktest.assertTrue(taF64.at(-3) === undefined, 'Float64Array at -length-1');
    let eF64 = new Float64Array(0);
    arktest.assertTrue(eF64.at(0) === undefined, 'Float64Array empty at(0)');
}