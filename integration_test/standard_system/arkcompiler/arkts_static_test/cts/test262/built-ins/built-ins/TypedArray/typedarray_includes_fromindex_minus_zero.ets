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

// arktsid: typedarray_includes_fromindex_minus_zero
// description: includes with a negative-zero fromIndex treats it as 0
// Conversion notes: ArkTS int has no -0; fromIndex 0. Representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(2);
    taI32[0] = 42; taI32[1] = 43;
    arktest.assertTrue(taI32.includes(42, 0), 'Int32Array includes 42 fromIndex 0');
    arktest.assertTrue(taI32.includes(43, 0), 'Int32Array includes 43 fromIndex 0');
    arktest.assertFalse(taI32.includes(44, 0), 'Int32Array includes 44 absent');
    let taU8 = new Uint8Array(2);
    taU8[0] = 42; taU8[1] = 43;
    arktest.assertTrue(taU8.includes(42, 0), 'Uint8Array includes 42 fromIndex 0');
    arktest.assertTrue(taU8.includes(43, 0), 'Uint8Array includes 43 fromIndex 0');
    arktest.assertFalse(taU8.includes(44, 0), 'Uint8Array includes 44 absent');
    let taF64 = new Float64Array(2);
    taF64[0] = 42; taF64[1] = 43;
    arktest.assertTrue(taF64.includes(42, 0), 'Float64Array includes 42 fromIndex 0');
    arktest.assertTrue(taF64.includes(43, 0), 'Float64Array includes 43 fromIndex 0');
    arktest.assertFalse(taF64.includes(44, 0), 'Float64Array includes 44 absent');
}