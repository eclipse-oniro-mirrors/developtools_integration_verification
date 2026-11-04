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

// arktsid: typedarray_reduceright_empty_no_initialvalue_throws
// description: reduceRight on an empty typed array without an initial value throws TypeError
// Conversion notes: representative TypedArray types unrolled; error name asserted via try/catch.

function main(): void {
    let taI32 = new Int32Array(0);
    let threwI32: boolean = false;
    let nameI32: string = '';
    try {
        taI32.reduceRight((acc: number, v: number): number => acc + v);
    } catch (e) {
        threwI32 = true;
        nameI32 = e.name;
    }

    arktest.assertTrue(threwI32, 'Int32Array empty reduceRight no initial threw');
    arktest.assertEQ(nameI32, 'TypeError', 'Int32Array error name');
    let taU8 = new Uint8Array(0);
    let threwU8: boolean = false;
    let nameU8: string = '';
    try {
        taU8.reduceRight((acc: number, v: number): number => acc + v);
    } catch (e) {
        threwU8 = true;
        nameU8 = e.name;
    }

    arktest.assertTrue(threwU8, 'Uint8Array empty reduceRight no initial threw');
    arktest.assertEQ(nameU8, 'TypeError', 'Uint8Array error name');
    let taF64 = new Float64Array(0);
    let threwF64: boolean = false;
    let nameF64: string = '';
    try {
        taF64.reduceRight((acc: number, v: number): number => acc + v);
    } catch (e) {
        threwF64 = true;
        nameF64 = e.name;
    }

    arktest.assertTrue(threwF64, 'Float64Array empty reduceRight no initial threw');
    arktest.assertEQ(nameF64, 'TypeError', 'Float64Array error name');
}