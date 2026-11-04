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

// arktsid: typedarray_bigint_copywithin_return_this
// description: copyWithin returns the same BigInt typed array instance
// Conversion notes: representative BigInt types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(4);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n; taBi64[3] = 4n;
    let rBi64 = taBi64.copyWithin(0, 0);
    arktest.assertTrue(rBi64 === taBi64, 'BigInt64Array copyWithin returns this');
    let taBu64 = new BigUint64Array(4);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n; taBu64[3] = 4n;
    let rBu64 = taBu64.copyWithin(0, 0);
    arktest.assertTrue(rBu64 === taBu64, 'BigUint64Array copyWithin returns this');
}