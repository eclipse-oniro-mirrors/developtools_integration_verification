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

// arktsid: typedarray_at_returns_item
// description: at(index) returns the element at the given index
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 42; taI32[1] = 43; taI32[2] = 0; taI32[3] = 0;
    arktest.assertEQ(taI32.at(0)!.valueOf(), 42, 'Int32Array at(0)');
    arktest.assertEQ(taI32.at(1)!.valueOf(), 43, 'Int32Array at(1)');
    arktest.assertEQ(taI32.at(-1)!.valueOf(), 0, 'Int32Array at(-1)');
    let taU8 = new Uint8Array(4);
    taU8[0] = 42; taU8[1] = 43; taU8[2] = 0; taU8[3] = 0;
    arktest.assertEQ(taU8.at(0)!.valueOf(), 42, 'Uint8Array at(0)');
    arktest.assertEQ(taU8.at(1)!.valueOf(), 43, 'Uint8Array at(1)');
    arktest.assertEQ(taU8.at(-1)!.valueOf(), 0, 'Uint8Array at(-1)');
    let taF64 = new Float64Array(4);
    taF64[0] = 42; taF64[1] = 43; taF64[2] = 0; taF64[3] = 0;
    arktest.assertEQ(taF64.at(0)!.valueOf(), 42, 'Float64Array at(0)');
    arktest.assertEQ(taF64.at(1)!.valueOf(), 43, 'Float64Array at(1)');
    arktest.assertEQ(taF64.at(-1)!.valueOf(), 0, 'Float64Array at(-1)');
}