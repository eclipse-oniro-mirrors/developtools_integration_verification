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

// arktsid: typedarray_bigint_filter_callbackfn_returns_abrupt
// description: an exception thrown in the BigInt filter callback propagates out
// Conversion notes: representative BigInt types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n;
    let threwBi64: boolean = false;
    try { taBi64.filter((v: BigInt): boolean => { throw new Error('boom'); }); } catch (e) { threwBi64 = true; }

    arktest.assertTrue(threwBi64, 'BigInt64Array filter propagates callback exception');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n;
    let threwBu64: boolean = false;
    try { taBu64.filter((v: BigInt): boolean => { throw new Error('boom'); }); } catch (e) { threwBu64 = true; }

    arktest.assertTrue(threwBu64, 'BigUint64Array filter propagates callback exception');
}