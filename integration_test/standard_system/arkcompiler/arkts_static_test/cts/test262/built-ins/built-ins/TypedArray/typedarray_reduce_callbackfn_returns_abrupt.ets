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

// arktsid: typedarray_reduce_callbackfn_returns_abrupt
// description: an exception thrown in the reduce callback propagates out
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    let threwI32: boolean = false;
    try {
        taI32.reduce((acc: number, v: number): number => { throw new Error('boom'); }, 0);
    } catch (e) {
        threwI32 = true;
    }

    arktest.assertTrue(threwI32, 'Int32Array reduce propagates callback exception');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    let threwU8: boolean = false;
    try {
        taU8.reduce((acc: number, v: number): number => { throw new Error('boom'); }, 0);
    } catch (e) {
        threwU8 = true;
    }

    arktest.assertTrue(threwU8, 'Uint8Array reduce propagates callback exception');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    let threwF64: boolean = false;
    try {
        taF64.reduce((acc: number, v: number): number => { throw new Error('boom'); }, 0);
    } catch (e) {
        threwF64 = true;
    }

    arktest.assertTrue(threwF64, 'Float64Array reduce propagates callback exception');
}