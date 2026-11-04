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

// arktsid: bigint64array_typedarrayarg_cross_ctor
// description: new BigInt64Array(BigUint64Array) creates a new BigInt64Array copying elements cross-type
// Conversion notes: Cross-BigInt-type copy; result has a new buffer.

function main(): void {
    let src = new BigUint64Array([7n, 8n]);
    let a = new BigInt64Array(src);
    arktest.assertEQ(a.length, 2, 'length');
    arktest.assertTrue(a.buffer !== src.buffer, 'new buffer');
    let v0: bigint = a[0];
    arktest.assertEQ(v0, 7n, 'elem 0');
}