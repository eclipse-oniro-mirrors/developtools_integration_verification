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

// arktsid: bigint_tobiguint64
// description: Assigning BigInt values to BigUint64Array indexes wraps them via ToBigUint64 (modulo 2^64, unsigned)
// Conversion notes: ToBigUint64 wraps index-assigned values modulo 2^64 (unsigned); out-of-range BigInt literals are
// truncated on assignment.

function main(): void {
    let typedArray = new BigUint64Array(1);

    typedArray[0] = 18446744073709551618n; // 2^64 + 2
    let v0: bigint = typedArray[0];
    arktest.assertEQ(v0, 2n, '2^64+2 => 2');

    typedArray[0] = 9223372036854775810n; // 2^63 + 2
    let v1: bigint = typedArray[0];
    arktest.assertEQ(v1, 9223372036854775810n, '2^63+2 => 2^63+2');

    typedArray[0] = 2n;
    let v2: bigint = typedArray[0];
    arktest.assertEQ(v2, 2n, '2 => 2');

    typedArray[0] = 0n;
    let v3: bigint = typedArray[0];
    arktest.assertEQ(v3, 0n, '0 => 0');

    typedArray[0] = -2n;
    let v4: bigint = typedArray[0];
    arktest.assertEQ(v4, 18446744073709551614n, '-2 => 2^64-2');

    typedArray[0] = -9223372036854775810n; // -(2^63 + 2)
    let v5: bigint = typedArray[0];
    arktest.assertEQ(v5, 9223372036854775806n, '-(2^63+2) => 2^64-(2^63+2)');

    typedArray[0] = -18446744073709551618n; // -(2^64 + 2)
    let v6: bigint = typedArray[0];
    arktest.assertEQ(v6, 18446744073709551614n, '-(2^64+2) => 2^64-2');
}