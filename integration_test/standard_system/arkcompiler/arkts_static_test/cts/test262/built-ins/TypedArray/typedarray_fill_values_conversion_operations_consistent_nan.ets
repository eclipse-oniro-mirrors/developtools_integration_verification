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

// arktsid: typedarray_fill_values_conversion_operations_consistent_nan
// description: fill(NaN) produces a consistent NaN bit pattern across all elements
// Conversion notes: Float64Array used; NaN consistency verified via raw byte comparison.

function main(): void {
    let f64 = new Float64Array(3);
    f64.fill(NaN);
    arktest.assertTrue(isNaN(f64[0]!.valueOf()), 'elem 0 is NaN');
    arktest.assertTrue(isNaN(f64[2]!.valueOf()), 'elem 2 is NaN');
    let bytes = new Uint8Array(f64.buffer);
    let consistent: boolean = true;
    for (let i: int = 0; i < 8; i++) {
        if (bytes[i] != bytes[8 + i] || bytes[i] != bytes[16 + i]) { consistent = false; }
    }
    arktest.assertTrue(consistent, 'NaN byte pattern consistent across elements');
}