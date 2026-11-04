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

// arktsid: typedarray_bigint_from_mapfn_arguments
// description: BigInt64Array.from passes (BigInt value, number index) to mapfn on each element
// Conversion notes: Dropped arguments.length assertions. Source Array<bigint>; mapfn receives BigInt wrapper.

function main(): void {
    let src: bigint[] = [42n, 43n, 44n];
    let kValues: bigint[] = [];
    let ks: number[] = [];
    BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
        kValues.push(v);
        ks.push(k);
        return v;
    });
    arktest.assertEQ(kValues.length, 3, 'call count');
    arktest.assertEQ(kValues[0], 42n, 'kValue 0');
    arktest.assertEQ(ks[0], 0, 'k 0');
    arktest.assertEQ(kValues[2], 44n, 'kValue 2');
    arktest.assertEQ(ks[2], 2, 'k 2');
}