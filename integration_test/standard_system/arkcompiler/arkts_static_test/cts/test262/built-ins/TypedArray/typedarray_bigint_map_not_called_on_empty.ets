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

// arktsid: typedarray_bigint_map_not_called_on_empty
// description: map does not invoke the callback on an empty BigInt typed array
// Conversion notes: representative BigInt types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(0);
    let cntBi64: int = 0;
    let rBi64 = taBi64.map((v: BigInt): BigInt => { cntBi64++; return v; });
    arktest.assertEQ(cntBi64, 0, 'BigInt64Array map empty not called');
    arktest.assertEQ(rBi64.length, 0, 'BigInt64Array map empty length');
    let taBu64 = new BigUint64Array(0);
    let cntBu64: int = 0;
    let rBu64 = taBu64.map((v: BigInt): BigInt => { cntBu64++; return v; });
    arktest.assertEQ(cntBu64, 0, 'BigUint64Array map empty not called');
    arktest.assertEQ(rBu64.length, 0, 'BigUint64Array map empty length');
}