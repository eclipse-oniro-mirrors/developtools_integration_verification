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

// arktsid: typedarray_bigint_set_src_range_exceeds_throws_rangeerror
// description: set throws when the BigInt source range exceeds the target length
// Conversion notes: error name varies (RangeError or subclass).

function main(): void {
    let taBi64 = new BigInt64Array(4);
    let srcBi64: bigint[] = [1n, 2n, 3n];
    let threwBi64: boolean = false;
    let nameBi64: string = '';
    try { taBi64.set(srcBi64, 2); } catch (e) { threwBi64 = true; nameBi64 = e.name; }

    arktest.assertTrue(threwBi64, 'BigInt64Array set range exceeds threw');
        arktest.assertTrue(nameBi64 == 'RangeError' || nameBi64 == 'IndexOutOfBoundsError',
        'BigInt64Array RangeError family: ' + nameBi64);
    let taBu64 = new BigUint64Array(4);
    let srcBu64: bigint[] = [1n, 2n, 3n];
    let threwBu64: boolean = false;
    let nameBu64: string = '';
    try { taBu64.set(srcBu64, 2); } catch (e) { threwBu64 = true; nameBu64 = e.name; }

    arktest.assertTrue(threwBu64, 'BigUint64Array set range exceeds threw');
        arktest.assertTrue(nameBu64 == 'RangeError' || nameBu64 == 'IndexOutOfBoundsError',
        'BigUint64Array RangeError family: ' + nameBu64);
}