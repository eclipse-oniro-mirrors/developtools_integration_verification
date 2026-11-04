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

// arktsid: typedarray_map_return_new_typedarray_conversion_operation
// description: map converts each callback result to the typed array's element type (byte wrapping)
// Conversion notes: representative Int8 wrapping; full byteConversionValues table reduced to representative cases.

function main(): void {
    let src = new Int8Array(3);
    src[0] = 0; src[1] = 0; src[2] = 0;
    let r = src.map((v: number): number => 257);
    arktest.assertEQ(r[0], 1, 'Int8 map(257) => 1');
    let r2 = new Int8Array(2).map((v: number): number => 128);
    // Int8Array fill(128) -> -128; map(128) result element wraps the same way
    let r2a = new Int8Array(1); r2a[0] = 0;
    let r2b = r2a.map((v: number): number => 128);
    arktest.assertEQ(r2b[0], -128, 'Int8 map(128) => -128');
    let u8 = new Uint8Array(1); u8[0] = 0;
    let ru = u8.map((v: number): number => -1);
    arktest.assertEQ(ru[0], 255, 'Uint8 map(-1) => 255');
}