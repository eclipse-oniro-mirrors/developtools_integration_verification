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

// arktsid: typedarray_reduce_result_is_last_callbackfn_return
// description: reduce returns the last callback return value
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    let rI32 = taI32.reduce((acc: number, v: number): number => v, 0);
    arktest.assertEQ(rI32!.valueOf(), 3, 'Int32Array reduce returns last callback return');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    let rU8 = taU8.reduce((acc: number, v: number): number => v, 0);
    arktest.assertEQ(rU8!.valueOf(), 3, 'Uint8Array reduce returns last callback return');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    let rF64 = taF64.reduce((acc: number, v: number): number => v, 0);
    arktest.assertEQ(rF64!.valueOf(), 3, 'Float64Array reduce returns last callback return');
}