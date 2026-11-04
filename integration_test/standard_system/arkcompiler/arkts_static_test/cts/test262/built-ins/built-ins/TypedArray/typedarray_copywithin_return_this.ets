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

// arktsid: typedarray_copywithin_return_this
// description: copyWithin returns the same typed array instance
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3; taI32[3] = 4;
    let rI32 = taI32.copyWithin(0, 0);
    arktest.assertTrue(rI32 === taI32, 'Int32Array copyWithin returns this');
    let taU8 = new Uint8Array(4);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3; taU8[3] = 4;
    let rU8 = taU8.copyWithin(0, 0);
    arktest.assertTrue(rU8 === taU8, 'Uint8Array copyWithin returns this');
    let taF64 = new Float64Array(4);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3; taF64[3] = 4;
    let rF64 = taF64.copyWithin(0, 0);
    arktest.assertTrue(rF64 === taF64, 'Float64Array copyWithin returns this');
}