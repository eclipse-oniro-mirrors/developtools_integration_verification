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

// arktsid: typedarray_bigint_keys_return_itor
// description: keys returns an iterator over the indices
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    let itBi64 = taBi64.keys();
    arktest.assertEQ(itBi64.next().value, 0, 'BigInt64Array keys 0');
    arktest.assertEQ(itBi64.next().value, 1, 'BigInt64Array keys 1');
    arktest.assertEQ(itBi64.next().value, 2, 'BigInt64Array keys 2');
    arktest.assertTrue(itBi64.next().done, 'BigInt64Array keys done');
    let taBu64 = new BigUint64Array(3);
    let itBu64 = taBu64.keys();
    arktest.assertEQ(itBu64.next().value, 0, 'BigUint64Array keys 0');
    arktest.assertEQ(itBu64.next().value, 1, 'BigUint64Array keys 1');
    arktest.assertEQ(itBu64.next().value, 2, 'BigUint64Array keys 2');
    arktest.assertTrue(itBu64.next().done, 'BigUint64Array keys done');
}