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

// arktsid: typedarray_bigint_reduce_return_first_value_without_callbackfn
// description: reduce on a single-element BigInt typed array without an initial value returns the element
// Conversion notes: result unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(1);
    taBi64[0] = 42n;
    let rBi64: bigint = taBi64.reduce((acc: BigInt, v: BigInt): BigInt => acc + v);
    arktest.assertEQ(rBi64, 42n, 'BigInt64Array single reduce returns elem');
    let taBu64 = new BigUint64Array(1);
    taBu64[0] = 42n;
    let rBu64: bigint = taBu64.reduce((acc: BigInt, v: BigInt): BigInt => acc + v);
    arktest.assertEQ(rBu64, 42n, 'BigUint64Array single reduce returns elem');
}