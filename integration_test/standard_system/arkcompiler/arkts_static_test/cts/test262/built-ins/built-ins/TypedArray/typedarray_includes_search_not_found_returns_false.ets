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

// arktsid: typedarray_includes_search_not_found_returns_false
// description: includes returns false when the search element is not present
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 42; taI32[1] = 43; taI32[2] = 44;
    arktest.assertFalse(taI32.includes(99), 'Int32Array includes absent');
    arktest.assertFalse(taI32.includes(0), 'Int32Array includes zero absent');
    let taU8 = new Uint8Array(3);
    taU8[0] = 42; taU8[1] = 43; taU8[2] = 44;
    arktest.assertFalse(taU8.includes(99), 'Uint8Array includes absent');
    arktest.assertFalse(taU8.includes(0), 'Uint8Array includes zero absent');
    let taF64 = new Float64Array(3);
    taF64[0] = 42; taF64[1] = 43; taF64[2] = 44;
    arktest.assertFalse(taF64.includes(99), 'Float64Array includes absent');
    arktest.assertFalse(taF64.includes(0), 'Float64Array includes zero absent');
}