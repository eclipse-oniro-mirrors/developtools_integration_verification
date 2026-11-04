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

// arktsid: typedarray_bigint_values_return_itor
// description: values returns an iterator over the element values
// Conversion notes: representative TypedArray types unrolled; BigInt values unboxed to bigint primitive before compare.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 0n; taBi64[1] = 42n; taBi64[2] = 64n;
    let itBi64 = taBi64.values();
    let v0Bi64: bigint = itBi64.next().value!;
    arktest.assertEQ(v0Bi64, 0n, 'BigInt64Array values 0');
    let v1Bi64: bigint = itBi64.next().value!;
    arktest.assertEQ(v1Bi64, 42n, 'BigInt64Array values 1');
    let v2Bi64: bigint = itBi64.next().value!;
    arktest.assertEQ(v2Bi64, 64n, 'BigInt64Array values 2');
    arktest.assertTrue(itBi64.next().done, 'BigInt64Array values done');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 0n; taBu64[1] = 42n; taBu64[2] = 64n;
    let itBu64 = taBu64.values();
    let v0Bu64: bigint = itBu64.next().value!;
    arktest.assertEQ(v0Bu64, 0n, 'BigUint64Array values 0');
    let v1Bu64: bigint = itBu64.next().value!;
    arktest.assertEQ(v1Bu64, 42n, 'BigUint64Array values 1');
    let v2Bu64: bigint = itBu64.next().value!;
    arktest.assertEQ(v2Bu64, 64n, 'BigUint64Array values 2');
    arktest.assertTrue(itBu64.next().done, 'BigUint64Array values done');
}