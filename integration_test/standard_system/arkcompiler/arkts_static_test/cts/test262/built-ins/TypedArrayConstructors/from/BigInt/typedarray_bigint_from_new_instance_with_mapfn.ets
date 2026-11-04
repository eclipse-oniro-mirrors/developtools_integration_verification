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

// arktsid: typedarray_bigint_from_new_instance_with_mapfn
// description: BigInt64Array.from(src, mapfn) applies mapfn to each BigInt element
// Conversion notes: BigInt64Array used; result elements unboxed to bigint.

function main(): void {
    let src: bigint[] = [42n, 43n];
    let a = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => v + v);
    arktest.assertEQ(a.length, 2, 'length');
    let v0: bigint = a[0];
    let v1: bigint = a[1];
    arktest.assertEQ(v0, 84n, 'elem 0');
    arktest.assertEQ(v1, 86n, 'elem 1');
}