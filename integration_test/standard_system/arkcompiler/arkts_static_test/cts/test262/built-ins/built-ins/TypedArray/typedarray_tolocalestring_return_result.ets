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

// arktsid: typedarray_tolocalestring_return_result
// description: toLocaleString returns a comma-joined string of the element locale strings
// Conversion notes: small integer values avoid locale-dependent grouping. Representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    arktest.assertEQ(taI32.toLocaleString(), '1,2,3', 'Int32Array toLocaleString');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    arktest.assertEQ(taU8.toLocaleString(), '1,2,3', 'Uint8Array toLocaleString');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    arktest.assertEQ(taF64.toLocaleString(), '1,2,3', 'Float64Array toLocaleString');
}