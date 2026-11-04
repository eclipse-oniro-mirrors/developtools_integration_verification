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

// arktsid: typedarray_byteoffset_return
// description: TypedArray.prototype.byteOffset reflects the view offset into the buffer
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let ta0I32 = new Int32Array();
    arktest.assertEQ(ta0I32.byteOffset, 0, 'Int32Array default byteOffset');
    let abI32 = new ArrayBuffer(Int32Array.BYTES_PER_ELEMENT * 8);
    let ta1I32 = new Int32Array(abI32, Int32Array.BYTES_PER_ELEMENT);
    arktest.assertEQ(ta1I32.byteOffset, Int32Array.BYTES_PER_ELEMENT, 'Int32Array offset byteOffset');
    let srcI32 = new Int32Array(4);
    let ta2I32 = new Int32Array(srcI32);
    arktest.assertEQ(ta2I32.byteOffset, 0, 'Int32Array copy byteOffset');
    let ta0U8 = new Uint8Array();
    arktest.assertEQ(ta0U8.byteOffset, 0, 'Uint8Array default byteOffset');
    let abU8 = new ArrayBuffer(Uint8Array.BYTES_PER_ELEMENT * 8);
    let ta1U8 = new Uint8Array(abU8, Uint8Array.BYTES_PER_ELEMENT);
    arktest.assertEQ(ta1U8.byteOffset, Uint8Array.BYTES_PER_ELEMENT, 'Uint8Array offset byteOffset');
    let srcU8 = new Uint8Array(4);
    let ta2U8 = new Uint8Array(srcU8);
    arktest.assertEQ(ta2U8.byteOffset, 0, 'Uint8Array copy byteOffset');
    let ta0F64 = new Float64Array();
    arktest.assertEQ(ta0F64.byteOffset, 0, 'Float64Array default byteOffset');
    let abF64 = new ArrayBuffer(Float64Array.BYTES_PER_ELEMENT * 8);
    let ta1F64 = new Float64Array(abF64, Float64Array.BYTES_PER_ELEMENT);
    arktest.assertEQ(ta1F64.byteOffset, Float64Array.BYTES_PER_ELEMENT, 'Float64Array offset byteOffset');
    let srcF64 = new Float64Array(4);
    let ta2F64 = new Float64Array(srcF64);
    arktest.assertEQ(ta2F64.byteOffset, 0, 'Float64Array copy byteOffset');
}