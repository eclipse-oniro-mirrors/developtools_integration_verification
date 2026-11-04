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

// arktsid: typedarray_set_typedarray_arg_src_range_exceeds_throws_rangeerror
// description: set throws when the source range exceeds the target length
// Conversion notes: error name varies (RangeError or IndexOutOfBoundsError subclass). Representative TypedArray types
// unrolled.

function main(): void {
    let taI32 = new Int32Array(4);
    let srcI32 = new Int32Array(3);
    srcI32[0] = 1; srcI32[1] = 2; srcI32[2] = 3;
    let threwI32: boolean = false;
    let nameI32: string = '';
    try { taI32.set(srcI32, 2); } catch (e) { threwI32 = true; nameI32 = e.name; }

    arktest.assertTrue(threwI32, 'Int32Array set range exceeds threw');
        arktest.assertTrue(nameI32 == 'RangeError' || nameI32 == 'IndexOutOfBoundsError',
        'Int32Array RangeError family: ' + nameI32);
    let taU8 = new Uint8Array(4);
    let srcU8 = new Uint8Array(3);
    srcU8[0] = 1; srcU8[1] = 2; srcU8[2] = 3;
    let threwU8: boolean = false;
    let nameU8: string = '';
    try { taU8.set(srcU8, 2); } catch (e) { threwU8 = true; nameU8 = e.name; }

    arktest.assertTrue(threwU8, 'Uint8Array set range exceeds threw');
        arktest.assertTrue(nameU8 == 'RangeError' || nameU8 == 'IndexOutOfBoundsError',
        'Uint8Array RangeError family: ' + nameU8);
    let taF64 = new Float64Array(4);
    let srcF64 = new Float64Array(3);
    srcF64[0] = 1; srcF64[1] = 2; srcF64[2] = 3;
    let threwF64: boolean = false;
    let nameF64: string = '';
    try { taF64.set(srcF64, 2); } catch (e) { threwF64 = true; nameF64 = e.name; }

    arktest.assertTrue(threwF64, 'Float64Array set range exceeds threw');
        arktest.assertTrue(nameF64 == 'RangeError' || nameF64 == 'IndexOutOfBoundsError',
        'Float64Array RangeError family: ' + nameF64);
}