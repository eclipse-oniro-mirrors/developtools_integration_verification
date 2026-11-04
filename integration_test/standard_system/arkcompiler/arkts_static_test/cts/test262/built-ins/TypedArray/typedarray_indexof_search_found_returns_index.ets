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

// arktsid: typedarray_indexof_search_found_returns_index
// description: indexOf returns the index of the first occurrence of the search element
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 42; taI32[1] = 43; taI32[2] = 44;
    arktest.assertEQ(taI32.indexOf(42), 0, 'Int32Array indexOf first');
    arktest.assertEQ(taI32.indexOf(43), 1, 'Int32Array indexOf middle');
    arktest.assertEQ(taI32.indexOf(44), 2, 'Int32Array indexOf last');
    let taU8 = new Uint8Array(3);
    taU8[0] = 42; taU8[1] = 43; taU8[2] = 44;
    arktest.assertEQ(taU8.indexOf(42), 0, 'Uint8Array indexOf first');
    arktest.assertEQ(taU8.indexOf(43), 1, 'Uint8Array indexOf middle');
    arktest.assertEQ(taU8.indexOf(44), 2, 'Uint8Array indexOf last');
    let taF64 = new Float64Array(3);
    taF64[0] = 42; taF64[1] = 43; taF64[2] = 44;
    arktest.assertEQ(taF64.indexOf(42), 0, 'Float64Array indexOf first');
    arktest.assertEQ(taF64.indexOf(43), 1, 'Float64Array indexOf middle');
    arktest.assertEQ(taF64.indexOf(44), 2, 'Float64Array indexOf last');
}