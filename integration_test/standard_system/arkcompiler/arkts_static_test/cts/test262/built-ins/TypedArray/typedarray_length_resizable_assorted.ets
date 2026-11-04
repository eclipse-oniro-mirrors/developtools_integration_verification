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

// arktsid: typedarray_length_resizable_assorted
// description: length reflects the view element count for assorted constructions over a resizable buffer (initial
// values)
// Conversion notes: ArkTS accessors are fixed at construction; only initial values checked, no resize. Representative
// TypedArray types unrolled.

function main(): void {
    let rabI32 = new ArrayBuffer(40, 80);
    let ta1I32 = new Int32Array(rabI32, 0, 3);
    arktest.assertEQ(ta1I32.length, 3, 'Int32Array resizable length len3');
    let ta2I32 = new Int32Array(rabI32);
    arktest.assertEQ(ta2I32.length, 40 / Int32Array.BYTES_PER_ELEMENT, 'Int32Array resizable length full');
    let rabU8 = new ArrayBuffer(40, 80);
    let ta1U8 = new Uint8Array(rabU8, 0, 3);
    arktest.assertEQ(ta1U8.length, 3, 'Uint8Array resizable length len3');
    let ta2U8 = new Uint8Array(rabU8);
    arktest.assertEQ(ta2U8.length, 40 / Uint8Array.BYTES_PER_ELEMENT, 'Uint8Array resizable length full');
    let rabF64 = new ArrayBuffer(40, 80);
    let ta1F64 = new Float64Array(rabF64, 0, 3);
    arktest.assertEQ(ta1F64.length, 3, 'Float64Array resizable length len3');
    let ta2F64 = new Float64Array(rabF64);
    arktest.assertEQ(ta2F64.length, 40 / Float64Array.BYTES_PER_ELEMENT, 'Float64Array resizable length full');
}