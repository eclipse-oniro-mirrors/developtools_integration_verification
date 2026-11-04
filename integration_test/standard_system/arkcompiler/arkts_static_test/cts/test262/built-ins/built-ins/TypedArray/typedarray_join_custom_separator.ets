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

// arktsid: typedarray_join_custom_separator
// description: join concatenates elements with a custom string separator
// Conversion notes: JS coercion separator cases (null/0/object) dropped; only String separators. Representative
// TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    arktest.assertEQ(taI32.join(','), '1,2,3', 'Int32Array join comma');
    arktest.assertEQ(taI32.join(' '), '1 2 3', 'Int32Array join space');
    arktest.assertEQ(taI32.join(''), '123', 'Int32Array join empty');
    arktest.assertEQ(taI32.join('abc'), '1abc2abc3', 'Int32Array join abc');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    arktest.assertEQ(taU8.join(','), '1,2,3', 'Uint8Array join comma');
    arktest.assertEQ(taU8.join(' '), '1 2 3', 'Uint8Array join space');
    arktest.assertEQ(taU8.join(''), '123', 'Uint8Array join empty');
    arktest.assertEQ(taU8.join('abc'), '1abc2abc3', 'Uint8Array join abc');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    arktest.assertEQ(taF64.join(','), '1,2,3', 'Float64Array join comma');
    arktest.assertEQ(taF64.join(' '), '1 2 3', 'Float64Array join space');
    arktest.assertEQ(taF64.join(''), '123', 'Float64Array join empty');
    arktest.assertEQ(taF64.join('abc'), '1abc2abc3', 'Float64Array join abc');
}