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
// arktsid: atomics_xor_bigint_non_shared_bufferdata
// description: Atomics.xor operates on a non-shared ArrayBuffer on a BigInt view backed by a non-shared ArrayBuffer
// Conversion notes: BigInt literals (n suffix) used for values.

function main(): void {
    let ab = new ArrayBuffer(8);
    let arr = new BigInt64Array(ab);
    arr[0] = 0n;
    let r = Atomics.xor(arr, 0, 1n);
    arktest.assertEQ(r, 0n, 'returns the previous value on non-shared buffer');
    arktest.assertEQ(Atomics.load(arr, 0), 1n, 'value after operation');
}