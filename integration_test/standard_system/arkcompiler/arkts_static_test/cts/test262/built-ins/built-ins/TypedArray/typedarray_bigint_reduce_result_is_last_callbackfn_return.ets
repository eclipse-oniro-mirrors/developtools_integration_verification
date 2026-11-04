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

// arktsid: typedarray_bigint_reduce_result_is_last_callbackfn_return
// description: reduce returns the last callback return value on a BigInt typed array
// Conversion notes: result unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n;
    let rBi64: bigint = taBi64.reduce((acc: BigInt, v: BigInt): BigInt => v, 0n);
    arktest.assertEQ(rBi64, 3n, 'BigInt64Array reduce returns last callback return');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n;
    let rBu64: bigint = taBu64.reduce((acc: BigInt, v: BigInt): BigInt => v, 0n);
    arktest.assertEQ(rBu64, 3n, 'BigUint64Array reduce returns last callback return');
}