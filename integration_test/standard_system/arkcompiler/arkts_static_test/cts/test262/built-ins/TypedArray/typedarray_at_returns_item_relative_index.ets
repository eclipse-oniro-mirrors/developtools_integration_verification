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

// arktsid: typedarray_at_returns_item_relative_index
// description: at supports negative indices wrapping from the end
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3; taI32[3] = 4;
    arktest.assertEQ(taI32.at(-1)!.valueOf(), 4, 'Int32Array at(-1)');
    arktest.assertEQ(taI32.at(-2)!.valueOf(), 3, 'Int32Array at(-2)');
    arktest.assertEQ(taI32.at(-4)!.valueOf(), 1, 'Int32Array at(-4)');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3; taU8[3] = 4;
    arktest.assertEQ(taU8.at(-1)!.valueOf(), 4, 'Uint8Array at(-1)');
    arktest.assertEQ(taU8.at(-2)!.valueOf(), 3, 'Uint8Array at(-2)');
    arktest.assertEQ(taU8.at(-4)!.valueOf(), 1, 'Uint8Array at(-4)');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3; taF64[3] = 4;
    arktest.assertEQ(taF64.at(-1)!.valueOf(), 4, 'Float64Array at(-1)');
    arktest.assertEQ(taF64.at(-2)!.valueOf(), 3, 'Float64Array at(-2)');
    arktest.assertEQ(taF64.at(-4)!.valueOf(), 1, 'Float64Array at(-4)');
}