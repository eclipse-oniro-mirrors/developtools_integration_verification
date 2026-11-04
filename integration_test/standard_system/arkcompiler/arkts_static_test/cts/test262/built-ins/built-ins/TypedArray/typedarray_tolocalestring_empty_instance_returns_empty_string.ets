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

// arktsid: typedarray_tolocalestring_empty_instance_returns_empty_string
// description: toLocaleString on an empty typed array returns the empty string
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(0);
    arktest.assertEQ(taI32.toLocaleString(), '', 'Int32Array toLocaleString empty');
    let taU8 = new Uint8Array(0);
    arktest.assertEQ(taU8.toLocaleString(), '', 'Uint8Array toLocaleString empty');
    let taF64 = new Float64Array(0);
    arktest.assertEQ(taF64.toLocaleString(), '', 'Float64Array toLocaleString empty');
}