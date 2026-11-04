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

// arktsid: typedarray_bigint_map_values_are_not_cached
// description: map on a BigInt typed array reads live values; mutating a later element is visible to subsequent
// callbacks
// Conversion notes: elements unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n;
    let seen1Bi64: bigint = 0n;
    taBi64.map((v: BigInt, i: int): BigInt => {
        if (i == 0) { taBi64[1] = 99n; }
        if (i == 1) { seen1Bi64 = v; }
        return v;
    });
    arktest.assertEQ(seen1Bi64, 99n, 'BigInt64Array map saw mutated index 1');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n;
    let seen1Bu64: bigint = 0n;
    taBu64.map((v: BigInt, i: int): BigInt => {
        if (i == 0) { taBu64[1] = 99n; }
        if (i == 1) { seen1Bu64 = v; }
        return v;
    });
    arktest.assertEQ(seen1Bu64, 99n, 'BigUint64Array map saw mutated index 1');
}