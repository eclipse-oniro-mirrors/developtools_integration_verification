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

// arktsid: typedarray_bigint_length_return
// description: TypedArray.prototype.length reflects the element count of the view
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let ta0Bi64 = new BigInt64Array();
    arktest.assertEQ(ta0Bi64.length, 0, 'BigInt64Array empty length');
    let abBi64 = new ArrayBuffer(BigInt64Array.BYTES_PER_ELEMENT * 3);
    let taBi64 = new BigInt64Array(abBi64);
    arktest.assertEQ(taBi64.length, 3, 'BigInt64Array from buffer length');
    let ta0Bu64 = new BigUint64Array();
    arktest.assertEQ(ta0Bu64.length, 0, 'BigUint64Array empty length');
    let abBu64 = new ArrayBuffer(BigUint64Array.BYTES_PER_ELEMENT * 3);
    let taBu64 = new BigUint64Array(abBu64);
    arktest.assertEQ(taBu64.length, 3, 'BigUint64Array from buffer length');
}