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

// arktsid: arraybuffer_init_zero
// description: new ArrayBuffer initializes all bytes to zero

function main(): void {
    let ab = new ArrayBuffer(9);
    let dv = new DataView(ab);

    arktest.assertEQ(dv.getUint8(0), 0, 'byte 0');
    arktest.assertEQ(dv.getUint8(1), 0, 'byte 1');
    arktest.assertEQ(dv.getUint8(2), 0, 'byte 2');
    arktest.assertEQ(dv.getUint8(3), 0, 'byte 3');
    arktest.assertEQ(dv.getUint8(4), 0, 'byte 4');
    arktest.assertEQ(dv.getUint8(5), 0, 'byte 5');
    arktest.assertEQ(dv.getUint8(6), 0, 'byte 6');
    arktest.assertEQ(dv.getUint8(7), 0, 'byte 7');
    arktest.assertEQ(dv.getUint8(8), 0, 'byte 8');
}