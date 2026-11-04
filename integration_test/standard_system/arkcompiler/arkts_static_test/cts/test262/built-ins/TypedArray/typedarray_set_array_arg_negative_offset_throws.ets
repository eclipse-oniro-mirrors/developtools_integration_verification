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

// arktsid: typedarray_set_array_arg_negative_offset_throws
// description: set with a negative offset throws RangeError
// Conversion notes: representative TypedArray types unrolled; error name asserted via try/catch.

function main(): void {
    let taI32 = new Int32Array(4);
    let threwI32: boolean = false;
    let nameI32: string = '';
    let srcI32: number[] = [1];
    try { taI32.set(srcI32, -1); } catch (e) { threwI32 = true; nameI32 = e.name; }

    arktest.assertTrue(threwI32, 'Int32Array set neg offset threw');
    arktest.assertEQ(nameI32, 'RangeError', 'Int32Array error name');
    let taU8 = new Uint8Array(4);
    let threwU8: boolean = false;
    let nameU8: string = '';
    let srcU8: number[] = [1];
    try { taU8.set(srcU8, -1); } catch (e) { threwU8 = true; nameU8 = e.name; }

    arktest.assertTrue(threwU8, 'Uint8Array set neg offset threw');
    arktest.assertEQ(nameU8, 'RangeError', 'Uint8Array error name');
    let taF64 = new Float64Array(4);
    let threwF64: boolean = false;
    let nameF64: string = '';
    let srcF64: number[] = [1];
    try { taF64.set(srcF64, -1); } catch (e) { threwF64 = true; nameF64 = e.name; }

    arktest.assertTrue(threwF64, 'Float64Array set neg offset threw');
    arktest.assertEQ(nameF64, 'RangeError', 'Float64Array error name');
}