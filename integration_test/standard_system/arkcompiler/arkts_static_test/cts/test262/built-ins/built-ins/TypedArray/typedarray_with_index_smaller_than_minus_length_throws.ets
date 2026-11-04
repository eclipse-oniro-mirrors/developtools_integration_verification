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

// arktsid: typedarray_with_index_smaller_than_minus_length_throws
// description: with throws RangeError when index < -length
// Conversion notes: ArkTS with() rejects negative index below -length. Representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    let threwI32: boolean = false;
    let nameI32: string = '';
    try { taI32.with(-4, 7); } catch (e) { threwI32 = true; nameI32 = e.name; }

    arktest.assertTrue(threwI32, 'Int32Array with idx<-length threw');
        arktest.assertTrue(nameI32 == 'RangeError' || nameI32 == 'IndexOutOfBoundsError',
        'Int32Array RangeError family: ' + nameI32);
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    let threwU8: boolean = false;
    let nameU8: string = '';
    try { taU8.with(-4, 7); } catch (e) { threwU8 = true; nameU8 = e.name; }

    arktest.assertTrue(threwU8, 'Uint8Array with idx<-length threw');
        arktest.assertTrue(nameU8 == 'RangeError' || nameU8 == 'IndexOutOfBoundsError',
        'Uint8Array RangeError family: ' + nameU8);
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    let threwF64: boolean = false;
    let nameF64: string = '';
    try { taF64.with(-4, 7); } catch (e) { threwF64 = true; nameF64 = e.name; }

    arktest.assertTrue(threwF64, 'Float64Array with idx<-length threw');
        arktest.assertTrue(nameF64 == 'RangeError' || nameF64 == 'IndexOutOfBoundsError',
        'Float64Array RangeError family: ' + nameF64);
}