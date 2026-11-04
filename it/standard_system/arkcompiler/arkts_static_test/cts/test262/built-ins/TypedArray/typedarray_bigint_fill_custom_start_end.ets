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

// arktsid: typedarray_bigint_fill_custom_start_end
// description: fill(value, start, end) writes to the [start, end) range
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let aBi64 = new BigInt64Array(3);
    aBi64.fill(8n, 1, 2);
    arktest.assertEQ(aBi64[0], 0n, 'BigInt64Array fill start/end 0');
    arktest.assertEQ(aBi64[1], 8n, 'BigInt64Array fill start/end 1');
    arktest.assertEQ(aBi64[2], 0n, 'BigInt64Array fill start/end 2');
    let aBu64 = new BigUint64Array(3);
    aBu64.fill(8n, 1, 2);
    arktest.assertEQ(aBu64[0], 0n, 'BigUint64Array fill start/end 0');
    arktest.assertEQ(aBu64[1], 8n, 'BigUint64Array fill start/end 1');
    arktest.assertEQ(aBu64[2], 0n, 'BigUint64Array fill start/end 2');
}