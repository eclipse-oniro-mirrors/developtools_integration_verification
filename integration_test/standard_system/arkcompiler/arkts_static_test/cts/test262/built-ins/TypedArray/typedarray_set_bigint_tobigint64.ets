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

// arktsid: typedarray_set_bigint_tobigint64
// description: BigInt64Array.set applies ToBigInt64 wraparound (modulo 2^64, signed)
// Conversion notes: values exceeding int64 range wrap as specified by ToBigInt64.

function main(): void {
    let bi = new BigInt64Array(4);
    let src: bigint[] = [18446744073709551618n, 9223372036854775810n, 2n, -2n];
    bi.set(src);
    let b0: bigint = bi[0];
    let b1: bigint = bi[1];
    let b2: bigint = bi[2];
    let b3: bigint = bi[3];
    arktest.assertEQ(b0, 2n, 'ToBigInt64(2^64+2) => 2');
    arktest.assertEQ(b1, -9223372036854775806n, 'ToBigInt64(2^63+2) => -2^63+2');
    arktest.assertEQ(b2, 2n, 'ToBigInt64(2) => 2');
    arktest.assertEQ(b3, -2n, 'ToBigInt64(-2) => -2');
}