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

// arktsid: typedarray_bigint_foreach_return_does_not_change_instance
// description: forEach leaves BigInt typed array elements unchanged
// Conversion notes: elements unboxed to bigint for comparison.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n;
    taBi64.forEach((v: BigInt, i: int) => {});
    let v0Bi64: bigint = taBi64[0];
    let v2Bi64: bigint = taBi64[2];
    arktest.assertEQ(v0Bi64, 1n, 'BigInt64Array forEach unchanged 0');
    arktest.assertEQ(v2Bi64, 3n, 'BigInt64Array forEach unchanged 2');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n;
    taBu64.forEach((v: BigInt, i: int) => {});
    let v0Bu64: bigint = taBu64[0];
    let v2Bu64: bigint = taBu64[2];
    arktest.assertEQ(v0Bu64, 1n, 'BigUint64Array forEach unchanged 0');
    arktest.assertEQ(v2Bu64, 3n, 'BigUint64Array forEach unchanged 2');
}