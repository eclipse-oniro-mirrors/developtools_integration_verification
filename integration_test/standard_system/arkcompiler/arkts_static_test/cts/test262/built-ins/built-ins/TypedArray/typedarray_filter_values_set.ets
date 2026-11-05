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

// arktsid: typedarray_filter_values_set
// description: filter returns a new typed array containing elements for which the callback returned true
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 10; taI32[1] = 41; taI32[2] = 42; taI32[3] = 43;
    let rI32 = taI32.filter((v: number): boolean => v > 40);
    arktest.assertEQ(rI32.length, 3, 'Int32Array filter length');
    arktest.assertEQ(rI32[0]!.valueOf(), 41, 'Int32Array filter 0');
    arktest.assertEQ(rI32[2]!.valueOf(), 43, 'Int32Array filter 2');
    let taU8 = new Uint8Array(4);
    taU8[0] = 10; taU8[1] = 41; taU8[2] = 42; taU8[3] = 43;
    let rU8 = taU8.filter((v: number): boolean => v > 40);
    arktest.assertEQ(rU8.length, 3, 'Uint8Array filter length');
    arktest.assertEQ(rU8[0]!.valueOf(), 41, 'Uint8Array filter 0');
    arktest.assertEQ(rU8[2]!.valueOf(), 43, 'Uint8Array filter 2');
    let taF64 = new Float64Array(4);
    taF64[0] = 10; taF64[1] = 41; taF64[2] = 42; taF64[3] = 43;
    let rF64 = taF64.filter((v: number): boolean => v > 40);
    arktest.assertEQ(rF64.length, 3, 'Float64Array filter length');
    arktest.assertEQ(rF64[0]!.valueOf(), 41, 'Float64Array filter 0');
    arktest.assertEQ(rF64[2]!.valueOf(), 43, 'Float64Array filter 2');
}