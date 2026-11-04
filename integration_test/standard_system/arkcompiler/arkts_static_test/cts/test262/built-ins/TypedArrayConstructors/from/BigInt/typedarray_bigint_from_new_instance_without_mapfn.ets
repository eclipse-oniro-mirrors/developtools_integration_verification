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

// arktsid: typedarray_bigint_from_new_instance_without_mapfn
// description: BigInt64Array.from(src) copies the BigInt source elements
// Conversion notes: BigInt64Array used; elements unboxed to bigint.

function main(): void {
    let a = BigInt64Array.from([42n, 43n, 42n]);
    arktest.assertEQ(a.length, 3, 'length');
    let v0: bigint = a[0];
    let v1: bigint = a[1];
    arktest.assertEQ(v0, 42n, 'elem 0');
    arktest.assertEQ(v1, 43n, 'elem 1');
}