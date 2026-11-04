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

// arktsid: typedarray_bigint_copywithin_negative_target
// description: copyWithin with a negative target wraps from the end on a BigInt typed array
// Conversion notes: elements unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(4);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n; taBi64[3] = 4n;
    taBi64.copyWithin(-2, 0);
    let v2Bi64: bigint = taBi64[2];
    let v3Bi64: bigint = taBi64[3];
    arktest.assertEQ(v2Bi64, 1n, 'BigInt64Array copyWithin neg-target 2');
    arktest.assertEQ(v3Bi64, 2n, 'BigInt64Array copyWithin neg-target 3');
    let taBu64 = new BigUint64Array(4);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n; taBu64[3] = 4n;
    taBu64.copyWithin(-2, 0);
    let v2Bu64: bigint = taBu64[2];
    let v3Bu64: bigint = taBu64[3];
    arktest.assertEQ(v2Bu64, 1n, 'BigUint64Array copyWithin neg-target 2');
    arktest.assertEQ(v3Bu64, 2n, 'BigUint64Array copyWithin neg-target 3');
}