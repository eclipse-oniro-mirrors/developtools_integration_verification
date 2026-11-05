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
// arktsid: atomics_compareExchange_bigint_good_views
// description: Atomics.compareExchange operates on BigInt TypedArray view types
// Conversion notes: SharedArrayBuffer replaced with ArrayBuffer; BigInt literals (n suffix) used for values.

function main(): void {
    let vBigInt64Array = new BigInt64Array(new ArrayBuffer(32));
    vBigInt64Array[0] = 10n;
    arktest.assertEQ(Atomics.compareExchange(vBigInt64Array, 0, 10n, 3n), 10n, 'BigInt64Array returns previous value');
    arktest.assertEQ(vBigInt64Array[0], 3n, 'BigInt64Array new value');
    let vBigUint64Array = new BigUint64Array(new ArrayBuffer(32));
    vBigUint64Array[0] = 10n;
        arktest.assertEQ(Atomics.compareExchange(vBigUint64Array, 0, 10n, 3n), 10n,
        'BigUint64Array returns previous value');
    arktest.assertEQ(vBigUint64Array[0], 3n, 'BigUint64Array new value');
}