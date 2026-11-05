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

// arktsid: typedarray_bigint_filter_values_set
// description: filter returns a new BigInt typed array containing matching elements
// Conversion notes: elements unboxed to bigint for comparison.

function main(): void {
    let taBi64 = new BigInt64Array(4);
    taBi64[0] = 10n; taBi64[1] = 41n; taBi64[2] = 42n; taBi64[3] = 43n;
    let rBi64 = taBi64.filter((v: BigInt): boolean => v > 40n);
    arktest.assertEQ(rBi64.length, 3, 'BigInt64Array filter length');
    let f0Bi64: bigint = rBi64[0];
    arktest.assertEQ(f0Bi64, 41n, 'BigInt64Array filter 0');
    let taBu64 = new BigUint64Array(4);
    taBu64[0] = 10n; taBu64[1] = 41n; taBu64[2] = 42n; taBu64[3] = 43n;
    let rBu64 = taBu64.filter((v: BigInt): boolean => v > 40n);
    arktest.assertEQ(rBu64.length, 3, 'BigUint64Array filter length');
    let f0Bu64: bigint = rBu64[0];
    arktest.assertEQ(f0Bu64, 41n, 'BigUint64Array filter 0');
}