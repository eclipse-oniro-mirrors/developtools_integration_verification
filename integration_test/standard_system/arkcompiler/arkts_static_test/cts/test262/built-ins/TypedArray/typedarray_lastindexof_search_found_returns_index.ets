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

// arktsid: typedarray_lastindexof_search_found_returns_index
// description: lastIndexOf returns the index of the last occurrence of the search element
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 42; taI32[1] = 43; taI32[2] = 44; taI32[3] = 43;
    arktest.assertEQ(taI32.lastIndexOf(43), 3, 'Int32Array lastIndexOf duplicate last');
    arktest.assertEQ(taI32.lastIndexOf(42), 0, 'Int32Array lastIndexOf first');
    arktest.assertEQ(taI32.lastIndexOf(44), 2, 'Int32Array lastIndexOf middle');
    let taU8 = new Uint8Array(4);
    taU8[0] = 42; taU8[1] = 43; taU8[2] = 44; taU8[3] = 43;
    arktest.assertEQ(taU8.lastIndexOf(43), 3, 'Uint8Array lastIndexOf duplicate last');
    arktest.assertEQ(taU8.lastIndexOf(42), 0, 'Uint8Array lastIndexOf first');
    arktest.assertEQ(taU8.lastIndexOf(44), 2, 'Uint8Array lastIndexOf middle');
    let taF64 = new Float64Array(4);
    taF64[0] = 42; taF64[1] = 43; taF64[2] = 44; taF64[3] = 43;
    arktest.assertEQ(taF64.lastIndexOf(43), 3, 'Float64Array lastIndexOf duplicate last');
    arktest.assertEQ(taF64.lastIndexOf(42), 0, 'Float64Array lastIndexOf first');
    arktest.assertEQ(taF64.lastIndexOf(44), 2, 'Float64Array lastIndexOf middle');
}