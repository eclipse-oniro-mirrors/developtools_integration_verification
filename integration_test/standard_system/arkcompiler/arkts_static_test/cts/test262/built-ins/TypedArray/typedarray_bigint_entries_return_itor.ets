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

// arktsid: typedarray_bigint_entries_return_itor
// description: entries returns an iterator of [index, value] pairs
// Conversion notes: representative TypedArray types unrolled; for-of used to avoid nullish tuple indexing.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 7n; taBi64[1] = 42n; taBi64[2] = 64n;
    let firstIdxBi64: int = -1;
    let cntBi64: int = 0;
    for (let pairBi64 of taBi64.entries()) {
        if (cntBi64 == 0) { firstIdxBi64 = pairBi64[0]; }
        cntBi64++;
    }
    arktest.assertEQ(cntBi64, 3, 'BigInt64Array entries count');
    arktest.assertEQ(firstIdxBi64, 0, 'BigInt64Array entries first idx');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 7n; taBu64[1] = 42n; taBu64[2] = 64n;
    let firstIdxBu64: int = -1;
    let cntBu64: int = 0;
    for (let pairBu64 of taBu64.entries()) {
        if (cntBu64 == 0) { firstIdxBu64 = pairBu64[0]; }
        cntBu64++;
    }
    arktest.assertEQ(cntBu64, 3, 'BigUint64Array entries count');
    arktest.assertEQ(firstIdxBu64, 0, 'BigUint64Array entries first idx');
}