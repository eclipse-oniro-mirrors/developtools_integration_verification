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

// arktsid: typedarray_map_values_are_not_cached
// description: map reads live values; mutating a later element during iteration is visible to subsequent callbacks
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    let seen1I32: number = 0;
    taI32.map((v: number, i: int): number => {
        if (i == 0) { taI32[1] = 99; }
        if (i == 1) { seen1I32 = v.valueOf(); }
        return v;
    });
    arktest.assertEQ(seen1I32, 99, 'Int32Array map saw mutated index 1');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    let seen1U8: number = 0;
    taU8.map((v: number, i: int): number => {
        if (i == 0) { taU8[1] = 99; }
        if (i == 1) { seen1U8 = v.valueOf(); }
        return v;
    });
    arktest.assertEQ(seen1U8, 99, 'Uint8Array map saw mutated index 1');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    let seen1F64: number = 0;
    taF64.map((v: number, i: int): number => {
        if (i == 0) { taF64[1] = 99; }
        if (i == 1) { seen1F64 = v.valueOf(); }
        return v;
    });
    arktest.assertEQ(seen1F64, 99, 'Float64Array map saw mutated index 1');
}