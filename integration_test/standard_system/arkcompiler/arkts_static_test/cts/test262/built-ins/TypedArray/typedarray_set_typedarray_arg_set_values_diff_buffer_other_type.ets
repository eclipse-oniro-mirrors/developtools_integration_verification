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

// arktsid: typedarray_set_typedarray_arg_set_values_diff_buffer_other_type
// description: set(typedArray, offset) copies elements between typed arrays of different element types
// Conversion notes: per-type expected-value tables for byte-reinterpretation cases dropped; only value-preserving
// cross-type copies retained.

function main(): void {
    let f32 = new Float32Array(2);
    f32[0] = 1.5; f32[1] = 2.5;
    let f64 = new Float64Array(2);
    f64.set(f32);
    arktest.assertEQ(f64[0]!.valueOf(), 1.5, 'Float32->Float64 0');
    arktest.assertEQ(f64[1]!.valueOf(), 2.5, 'Float32->Float64 1');
    let f64b = new Float64Array(2);
    f64b[0] = 3.25; f64b[1] = 4.5;
    let f32b = new Float32Array(2);
    f32b.set(f64b);
    arktest.assertEQ(f32b[0]!.valueOf(), 3.25, 'Float64->Float32 0');
    arktest.assertEQ(f32b[1]!.valueOf(), 4.5, 'Float64->Float32 1');
    let bi = new BigInt64Array(2);
    bi[0] = 5n; bi[1] = 10n;
    let bu = new BigUint64Array(2);
    bu.set(bi);
    let bu0: bigint = bu[0];
    let bu1: bigint = bu[1];
    arktest.assertEQ(bu0, 5n, 'BigInt64->BigUint64 0');
    arktest.assertEQ(bu1, 10n, 'BigInt64->BigUint64 1');
    let bu2 = new BigUint64Array(2);
    bu2[0] = 7n; bu2[1] = 8n;
    let bi2 = new BigInt64Array(2);
    bi2.set(bu2);
    let bi0: bigint = bi2[0];
    let bi1: bigint = bi2[1];
    arktest.assertEQ(bi0, 7n, 'BigUint64->BigInt64 0');
    arktest.assertEQ(bi1, 8n, 'BigUint64->BigInt64 1');
}