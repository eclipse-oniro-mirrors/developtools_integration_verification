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

// arktsid: typedarray_bigint_fill_returns_this
// description: fill returns the same typed array instance
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    let rBi64 = taBi64.fill(7n);
    arktest.assertTrue(rBi64 === taBi64, 'BigInt64Array fill returns this');
    let taBu64 = new BigUint64Array(3);
    let rBu64 = taBu64.fill(7n);
    arktest.assertTrue(rBu64 === taBu64, 'BigUint64Array fill returns this');
}