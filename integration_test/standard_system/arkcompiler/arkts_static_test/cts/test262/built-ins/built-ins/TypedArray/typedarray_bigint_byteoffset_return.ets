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

// arktsid: typedarray_bigint_byteoffset_return
// description: TypedArray.prototype.byteOffset reflects the view offset into the buffer
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let ta0Bi64 = new BigInt64Array();
    arktest.assertEQ(ta0Bi64.byteOffset, 0, 'BigInt64Array default byteOffset');
    let abBi64 = new ArrayBuffer(BigInt64Array.BYTES_PER_ELEMENT * 8);
    let ta1Bi64 = new BigInt64Array(abBi64, BigInt64Array.BYTES_PER_ELEMENT);
    arktest.assertEQ(ta1Bi64.byteOffset, BigInt64Array.BYTES_PER_ELEMENT, 'BigInt64Array offset byteOffset');
    let srcBi64 = new BigInt64Array(4);
    let ta2Bi64 = new BigInt64Array(srcBi64);
    arktest.assertEQ(ta2Bi64.byteOffset, 0, 'BigInt64Array copy byteOffset');
    let ta0Bu64 = new BigUint64Array();
    arktest.assertEQ(ta0Bu64.byteOffset, 0, 'BigUint64Array default byteOffset');
    let abBu64 = new ArrayBuffer(BigUint64Array.BYTES_PER_ELEMENT * 8);
    let ta1Bu64 = new BigUint64Array(abBu64, BigUint64Array.BYTES_PER_ELEMENT);
    arktest.assertEQ(ta1Bu64.byteOffset, BigUint64Array.BYTES_PER_ELEMENT, 'BigUint64Array offset byteOffset');
    let srcBu64 = new BigUint64Array(4);
    let ta2Bu64 = new BigUint64Array(srcBu64);
    arktest.assertEQ(ta2Bu64.byteOffset, 0, 'BigUint64Array copy byteOffset');
}