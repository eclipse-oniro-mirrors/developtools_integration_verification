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

// arktsid: typedarray_set_bigint_tobiguint64
// description: BigUint64Array.set applies ToBigUint64 wraparound (modulo 2^64, unsigned)
// Conversion notes: values exceeding uint64 range wrap as specified by ToBigUint64; negatives wrap to unsigned.

function main(): void {
    let bu = new BigUint64Array(4);
    let src: bigint[] = [18446744073709551618n, -2n, 2n, 18446744073709551615n];
    bu.set(src);
    let b0: bigint = bu[0];
    let b1: bigint = bu[1];
    let b2: bigint = bu[2];
    let b3: bigint = bu[3];
    arktest.assertEQ(b0, 2n, 'ToBigUint64(2^64+2) => 2');
    arktest.assertEQ(b1, 18446744073709551614n, 'ToBigUint64(-2) => 2^64-2');
    arktest.assertEQ(b2, 2n, 'ToBigUint64(2) => 2');
    arktest.assertEQ(b3, 18446744073709551615n, 'ToBigUint64(2^64-1) => max');
}