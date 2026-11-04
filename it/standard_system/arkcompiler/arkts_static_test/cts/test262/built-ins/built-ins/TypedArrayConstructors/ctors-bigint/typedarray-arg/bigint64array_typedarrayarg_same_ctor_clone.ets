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

// arktsid: bigint64array_typedarrayarg_same_ctor_clone
// description: new BigInt64Array(BigInt64Array) creates a new cloned typed array with a new buffer
// Conversion notes: Same-type copy; elements preserved, new buffer.

function main(): void {
    let src = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
    let a = new BigInt64Array(src);
    arktest.assertEQ(a.length, 7, 'length');
    arktest.assertTrue(a.buffer !== src.buffer, 'new buffer');
    let v0: bigint = a[0];
    arktest.assertEQ(v0, 1n, 'elem 0');
}