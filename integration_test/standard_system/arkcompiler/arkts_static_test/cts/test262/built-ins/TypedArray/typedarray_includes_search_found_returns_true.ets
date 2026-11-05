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

// arktsid: typedarray_includes_search_found_returns_true
// description: includes returns true when the search element is present, false otherwise
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3; taI32[3] = 4;
    arktest.assertTrue(taI32.includes(3), 'Int32Array includes found true');
    arktest.assertFalse(taI32.includes(9), 'Int32Array includes absent false');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3; taU8[3] = 4;
    arktest.assertTrue(taU8.includes(3), 'Uint8Array includes found true');
    arktest.assertFalse(taU8.includes(9), 'Uint8Array includes absent false');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3; taF64[3] = 4;
    arktest.assertTrue(taF64.includes(3), 'Float64Array includes found true');
    arktest.assertFalse(taF64.includes(9), 'Float64Array includes absent false');
}