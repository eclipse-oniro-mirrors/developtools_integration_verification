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

// arktsid: typedarray_bigint_fill_values
// description: fill(value) writes value to every element
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64.fill(8n);
    arktest.assertEQ(taBi64[0], 8n, 'BigInt64Array fill 0');
    arktest.assertEQ(taBi64[2], 8n, 'BigInt64Array fill 2');
    let eBi64 = new BigInt64Array(0);
    eBi64.fill(8n);
    arktest.assertEQ(eBi64.length, 0, 'BigInt64Array fill empty');
    let taBu64 = new BigUint64Array(3);
    taBu64.fill(8n);
    arktest.assertEQ(taBu64[0], 8n, 'BigUint64Array fill 0');
    arktest.assertEQ(taBu64[2], 8n, 'BigUint64Array fill 2');
    let eBu64 = new BigUint64Array(0);
    eBu64.fill(8n);
    arktest.assertEQ(eBu64.length, 0, 'BigUint64Array fill empty');
}