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

// arktsid: typedarray_bigint_sort_sorted_values
// description: sort with no comparator sorts BigInt typed array elements in numeric order
// Conversion notes: elements unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(4);
    taBi64[0] = 4n; taBi64[1] = 3n; taBi64[2] = 2n; taBi64[3] = 1n;
    taBi64.sort();
    let v0Bi64: bigint = taBi64[0];
    let v3Bi64: bigint = taBi64[3];
    arktest.assertEQ(v0Bi64, 1n, 'BigInt64Array sort 0');
    arktest.assertEQ(v3Bi64, 4n, 'BigInt64Array sort 3');
    let taBu64 = new BigUint64Array(4);
    taBu64[0] = 4n; taBu64[1] = 3n; taBu64[2] = 2n; taBu64[3] = 1n;
    taBu64.sort();
    let v0Bu64: bigint = taBu64[0];
    let v3Bu64: bigint = taBu64[3];
    arktest.assertEQ(v0Bu64, 1n, 'BigUint64Array sort 0');
    arktest.assertEQ(v3Bu64, 4n, 'BigUint64Array sort 3');
}