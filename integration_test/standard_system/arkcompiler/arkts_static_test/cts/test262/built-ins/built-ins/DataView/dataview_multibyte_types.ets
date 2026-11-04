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
// arktsid: dataview_multibyte_types
// description: DataView set/get for Int32, Uint16, Float32, Float64 round-trip

function main(): void {
    let ab = new ArrayBuffer(16);
    let dv = new DataView(ab);

    // getUint16 + setUint16
    dv.setUint16(0, 65535);
    arktest.assertEQ(dv.getUint16(0), 65535);

    // getInt32 + setInt32
    dv.setInt32(2, -2147483648);
    arktest.assertEQ(dv.getInt32(2), -2147483648);

    dv.setInt32(6, 2147483647);
    arktest.assertEQ(dv.getInt32(6), 2147483647);

    // getFloat32 + setFloat32
    dv.setFloat32(10, 3.14);
    let f32: double = dv.getFloat32(10);
    arktest.assertTrue(f32 > 3.13);
    arktest.assertTrue(f32 < 3.15);

    // getFloat64 at aligned offset
    let ab2 = new ArrayBuffer(8);
    let dv2 = new DataView(ab2);
    dv2.setFloat64(0, 2.718281828);
    let f64: double = dv2.getFloat64(0);
    arktest.assertTrue(f64 > 2.71);
    arktest.assertTrue(f64 < 2.72);
}
