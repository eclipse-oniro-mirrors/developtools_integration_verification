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

// arktsid: typedarray_bigint_map_return_values
// description: map returns a new BigInt typed array with each element transformed
// Conversion notes: elements unboxed to bigint for comparison.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 4n;
    let mBi64 = taBi64.map((v: BigInt): BigInt => v + 10n);
    let m0Bi64: bigint = mBi64[0];
    let m1Bi64: bigint = mBi64[1];
    let m2Bi64: bigint = mBi64[2];
    arktest.assertEQ(m0Bi64, 11n, 'BigInt64Array map 0');
    arktest.assertEQ(m1Bi64, 12n, 'BigInt64Array map 1');
    arktest.assertEQ(m2Bi64, 14n, 'BigInt64Array map 2');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 4n;
    let mBu64 = taBu64.map((v: BigInt): BigInt => v + 10n);
    let m0Bu64: bigint = mBu64[0];
    let m1Bu64: bigint = mBu64[1];
    let m2Bu64: bigint = mBu64[2];
    arktest.assertEQ(m0Bu64, 11n, 'BigUint64Array map 0');
    arktest.assertEQ(m1Bu64, 12n, 'BigUint64Array map 1');
    arktest.assertEQ(m2Bu64, 14n, 'BigUint64Array map 2');
}