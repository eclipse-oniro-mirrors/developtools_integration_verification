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

// arktsid: biguint64array_objectarg_bigint_wrap_uint64
// description: new BigUint64Array([2^64+2n]) wraps the value to uint64 (modulo 2^64, unsigned)
// Conversion notes: ToBigUint64 wraparound.

function main(): void {
    let a = new BigUint64Array([18446744073709551618n]);
    let v0: bigint = a[0];
    arktest.assertEQ(v0, 2n, '2^64+2 => 2');
}