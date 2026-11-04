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

// arktsid: typedarray_set_typedarray_arg_set_values_same_buffer_other_type
// description: set from a typed array of a different element type backed by the same buffer performs a byte-level copy
// Conversion notes: BigInt64<->BigUint64 share the 8-byte element size; small positive values are preserved.

function main(): void {
    let ab = new ArrayBuffer(16);
    let bi = new BigInt64Array(ab);
    bi[0] = 5n; bi[1] = 10n;
    let bu = new BigUint64Array(ab, 0, 2);
    bi.set(bu);
    let b0: bigint = bi[0];
    let b1: bigint = bi[1];
    arktest.assertEQ(b0, 5n, 'BigInt64<-BigUint64 same-buffer 0');
    arktest.assertEQ(b1, 10n, 'BigInt64<-BigUint64 same-buffer 1');
    let ab2 = new ArrayBuffer(16);
    let bu2 = new BigUint64Array(ab2);
    bu2[0] = 7n; bu2[1] = 8n;
    let bi2 = new BigInt64Array(ab2, 0, 2);
    bu2.set(bi2);
    let u0: bigint = bu2[0];
    let u1: bigint = bu2[1];
    arktest.assertEQ(u0, 7n, 'BigUint64<-BigInt64 same-buffer 0');
    arktest.assertEQ(u1, 8n, 'BigUint64<-BigInt64 same-buffer 1');
}