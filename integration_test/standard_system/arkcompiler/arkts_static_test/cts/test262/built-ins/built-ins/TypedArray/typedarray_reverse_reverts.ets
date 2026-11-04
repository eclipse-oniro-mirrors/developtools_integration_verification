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

// arktsid: typedarray_reverse_reverts
// description: reverse reverses the element order in place
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 43; taI32[3] = 42;
    taI32.reverse();
    arktest.assertEQ(taI32[0]!.valueOf(), 42, 'Int32Array reverse 0');
    arktest.assertEQ(taI32[1]!.valueOf(), 43, 'Int32Array reverse 1');
    arktest.assertEQ(taI32[3]!.valueOf(), 1, 'Int32Array reverse 3');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 43; taU8[3] = 42;
    taU8.reverse();
    arktest.assertEQ(taU8[0]!.valueOf(), 42, 'Uint8Array reverse 0');
    arktest.assertEQ(taU8[1]!.valueOf(), 43, 'Uint8Array reverse 1');
    arktest.assertEQ(taU8[3]!.valueOf(), 1, 'Uint8Array reverse 3');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 43; taF64[3] = 42;
    taF64.reverse();
    arktest.assertEQ(taF64[0]!.valueOf(), 42, 'Float64Array reverse 0');
    arktest.assertEQ(taF64[1]!.valueOf(), 43, 'Float64Array reverse 1');
    arktest.assertEQ(taF64[3]!.valueOf(), 1, 'Float64Array reverse 3');
}