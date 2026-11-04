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

// arktsid: typedarray_bigint_join_result_tostring_simple_value
// description: join concatenates BigInt element string representations with the separator
// Conversion notes: representative BigInt types unrolled.

function main(): void {
    let taBi64 = new BigInt64Array(3);
    taBi64[0] = 1n; taBi64[1] = 2n; taBi64[2] = 3n;
    arktest.assertEQ(taBi64.join(','), '1,2,3', 'BigInt64Array join simple');
    arktest.assertEQ(taBi64.join(), '1,2,3', 'BigInt64Array join default sep');
    let taBu64 = new BigUint64Array(3);
    taBu64[0] = 1n; taBu64[1] = 2n; taBu64[2] = 3n;
    arktest.assertEQ(taBu64.join(','), '1,2,3', 'BigUint64Array join simple');
    arktest.assertEQ(taBu64.join(), '1,2,3', 'BigUint64Array join default sep');
}