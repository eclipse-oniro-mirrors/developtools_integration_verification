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

// arktsid: typedarray_join_result_tostring_simple_value
// description: join concatenates element string representations with the separator
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 0; taI32[2] = 2; taI32[3] = 3;
    arktest.assertEQ(taI32.join(','), '1,0,2,3', 'Int32Array join simple');
    arktest.assertEQ(taI32.join(), '1,0,2,3', 'Int32Array join default sep');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 0; taU8[2] = 2; taU8[3] = 3;
    arktest.assertEQ(taU8.join(','), '1,0,2,3', 'Uint8Array join simple');
    arktest.assertEQ(taU8.join(), '1,0,2,3', 'Uint8Array join default sep');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 0; taF64[2] = 2; taF64[3] = 3;
    arktest.assertEQ(taF64.join(','), '1,0,2,3', 'Float64Array join simple');
    arktest.assertEQ(taF64.join(), '1,0,2,3', 'Float64Array join default sep');
}