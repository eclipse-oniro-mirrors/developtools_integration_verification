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

// arktsid: typedarray_bigint_reduce_empty_no_initialvalue_throws
// description: reduce on an empty BigInt typed array without an initial value throws TypeError
// Conversion notes: error name asserted via try/catch.

function main(): void {
    let taBi64 = new BigInt64Array(0);
    let threwBi64: boolean = false;
    let nameBi64: string = '';
    try {
        taBi64.reduce((acc: BigInt, v: BigInt): BigInt => acc + v);
    } catch (e) {
        threwBi64 = true;
        nameBi64 = e.name;
    }

    arktest.assertTrue(threwBi64, 'BigInt64Array empty reduce no initial threw');
    arktest.assertEQ(nameBi64, 'TypeError', 'BigInt64Array error name');
    let taBu64 = new BigUint64Array(0);
    let threwBu64: boolean = false;
    let nameBu64: string = '';
    try {
        taBu64.reduce((acc: BigInt, v: BigInt): BigInt => acc + v);
    } catch (e) {
        threwBu64 = true;
        nameBu64 = e.name;
    }

    arktest.assertTrue(threwBu64, 'BigUint64Array empty reduce no initial threw');
    arktest.assertEQ(nameBu64, 'TypeError', 'BigUint64Array error name');
}