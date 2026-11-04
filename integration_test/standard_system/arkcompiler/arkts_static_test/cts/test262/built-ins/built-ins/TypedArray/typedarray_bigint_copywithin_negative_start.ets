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

// arktsid: typedarray_bigint_copywithin_negative_start
// description: copyWithin with a negative start wraps from the end on a BigInt typed array
// Conversion notes: elements unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(4);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n; taBi64[3] = 4n;
    taBi64.copyWithin(0, -2);
    let v0Bi64: bigint = taBi64[0];
    let v1Bi64: bigint = taBi64[1];
    arktest.assertEQ(v0Bi64, 3n, 'BigInt64Array copyWithin neg-start 0');
    arktest.assertEQ(v1Bi64, 4n, 'BigInt64Array copyWithin neg-start 1');
    let taBu64 = new BigUint64Array(4);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n; taBu64[3] = 4n;
    taBu64.copyWithin(0, -2);
    let v0Bu64: bigint = taBu64[0];
    let v1Bu64: bigint = taBu64[1];
    arktest.assertEQ(v0Bu64, 3n, 'BigUint64Array copyWithin neg-start 0');
    arktest.assertEQ(v1Bu64, 4n, 'BigUint64Array copyWithin neg-start 1');
}