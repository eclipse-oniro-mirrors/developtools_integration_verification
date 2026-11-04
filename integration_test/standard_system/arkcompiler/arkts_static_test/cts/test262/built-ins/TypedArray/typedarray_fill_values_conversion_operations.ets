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

// arktsid: typedarray_fill_values_conversion_operations
// description: fill converts the value per the element type's conversion operation (byte wrapping)
// Conversion notes: representative Int8/Uint8 wrapping cases from byteConversionValues; full per-type table reduced to
// representative cases.

function main(): void {
    // Int8Array: ToInt8
    let i8a = new Int8Array(1); i8a.fill(257);
    arktest.assertEQ(i8a[0], 1, 'Int8 fill(257) => 1');
    let i8b = new Int8Array(1); i8b.fill(128);
    arktest.assertEQ(i8b[0], -128, 'Int8 fill(128) => -128');
    let i8c = new Int8Array(1); i8c.fill(-129);
    arktest.assertEQ(i8c[0], 127, 'Int8 fill(-129) => 127');
    // Uint8Array: ToUint8
    let u8a = new Uint8Array(1); u8a.fill(-1);
    arktest.assertEQ(u8a[0], 255, 'Uint8 fill(-1) => 255');
    let u8b = new Uint8Array(1); u8b.fill(256);
    arktest.assertEQ(u8b[0], 0, 'Uint8 fill(256) => 0');
    let u8c = new Uint8Array(1); u8c.fill(257);
    arktest.assertEQ(u8c[0], 1, 'Uint8 fill(257) => 1');
    // Int32Array: no wrap for small values
    let i32 = new Int32Array(1); i32.fill(257);
    arktest.assertEQ(i32[0], 257, 'Int32 fill(257) => 257');
}