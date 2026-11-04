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

// arktsid: getbigint64_return_values_custom_offset
// description: Return values from Buffer using a custom offset
// Conversion notes: reads through a byteOffset=4 view over a 16-byte buffer;
//   both big-endian (littleEndian=false) and little-endian (true) are asserted.

function main(): void {
    let buffer = new ArrayBuffer(16);
    let sample = new DataView(buffer, 0);

    sample.setUint8(0, 0x27);
    sample.setUint8(1, 0x02);
    sample.setUint8(2, 0x06);
    sample.setUint8(3, 0x02);
    sample.setUint8(4, 0x80);
    sample.setUint8(5, 0x00);
    sample.setUint8(6, 0x80);
    sample.setUint8(7, 0x01);
    sample.setUint8(8, 0x7f);
    sample.setUint8(9, 0x00);
    sample.setUint8(10, 0x01);
    sample.setUint8(11, 0x02);
    sample.setUint8(12, 0x80);
    sample.setUint8(13, 0x7f);
    sample.setUint8(14, 0xff);
    sample.setUint8(15, 0x80);

    sample = new DataView(buffer, 4);

    arktest.assertEQ(sample.getBigInt64(0, false), -9223231292940746494n, '0, false');
    arktest.assertEQ(sample.getBigInt64(1, false), 36030441991504512n, '1, false');
    arktest.assertEQ(sample.getBigInt64(2, false), -9222950923884396417n, '2, false');
    arktest.assertEQ(sample.getBigInt64(3, false), 107804920417124351n, '3, false');
    arktest.assertEQ(sample.getBigInt64(4, false), 9151315553074282368n, '4, false');

    arktest.assertEQ(sample.getBigInt64(0, true), 144397208538579072n, '0, true');
    arktest.assertEQ(sample.getBigInt64(1, true), -9222807985258921984n, '1, true');
    arktest.assertEQ(sample.getBigInt64(2, true), 9187345443162358144n, '2, true');
    arktest.assertEQ(sample.getBigInt64(3, true), -36169525900574975n, '3, true');
    arktest.assertEQ(sample.getBigInt64(4, true), -9151455730027396993n, '4, true');
}