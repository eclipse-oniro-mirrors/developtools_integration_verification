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

// arktsid: typedarray_bytelength_return
// description: TypedArray.prototype.byteLength reflects the byte length of the view
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let ta0I32 = new Int32Array();
    arktest.assertEQ(ta0I32.byteLength, 0, 'Int32Array empty byteLength');
    let abI32 = new ArrayBuffer(Int32Array.BYTES_PER_ELEMENT * 3);
    let taI32 = new Int32Array(abI32);
    arktest.assertEQ(taI32.byteLength, Int32Array.BYTES_PER_ELEMENT * 3, 'Int32Array from buffer');
    let ta0U8 = new Uint8Array();
    arktest.assertEQ(ta0U8.byteLength, 0, 'Uint8Array empty byteLength');
    let abU8 = new ArrayBuffer(Uint8Array.BYTES_PER_ELEMENT * 3);
    let taU8 = new Uint8Array(abU8);
    arktest.assertEQ(taU8.byteLength, Uint8Array.BYTES_PER_ELEMENT * 3, 'Uint8Array from buffer');
    let ta0F64 = new Float64Array();
    arktest.assertEQ(ta0F64.byteLength, 0, 'Float64Array empty byteLength');
    let abF64 = new ArrayBuffer(Float64Array.BYTES_PER_ELEMENT * 3);
    let taF64 = new Float64Array(abF64);
    arktest.assertEQ(taF64.byteLength, Float64Array.BYTES_PER_ELEMENT * 3, 'Float64Array from buffer');
}