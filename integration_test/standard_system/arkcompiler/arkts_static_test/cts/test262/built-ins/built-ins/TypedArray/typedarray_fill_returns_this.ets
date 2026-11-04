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

// arktsid: typedarray_fill_returns_this
// description: fill returns the same typed array instance
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    let rI32 = taI32.fill(7);
    arktest.assertTrue(rI32 === taI32, 'Int32Array fill returns this');
    let taU8 = new Uint8Array(3);
    let rU8 = taU8.fill(7);
    arktest.assertTrue(rU8 === taU8, 'Uint8Array fill returns this');
    let taF64 = new Float64Array(3);
    let rF64 = taF64.fill(7);
    arktest.assertTrue(rF64 === taF64, 'Float64Array fill returns this');
}