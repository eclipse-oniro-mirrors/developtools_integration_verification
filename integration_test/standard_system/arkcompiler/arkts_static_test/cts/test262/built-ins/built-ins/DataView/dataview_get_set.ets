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

// arktsid: dataview_get_set
// description: DataView getUint8/setUint8 round-trip and integer type access
// Migrated from test262: built-ins/DataView get/set tests

function main(): void {
    let ab = new ArrayBuffer(8);
    let dv = new DataView(ab);

    // getUint8 after construction returns 0 (initialized to zero)
    arktest.assertEQ(dv.getUint8(0), 0);
    arktest.assertEQ(dv.getUint8(7), 0);

    // setUint8 + getUint8 round-trip
    dv.setUint8(0, 42);
    arktest.assertEQ(dv.getUint8(0), 42);

    dv.setUint8(1, 255);
    arktest.assertEQ(dv.getUint8(1), 255);

    // setInt8 negative value
    dv.setInt8(2, -1);
    arktest.assertEQ(dv.getInt8(2), -1);

    // setInt16 round-trip
    dv.setInt16(4, 12345);
    arktest.assertEQ(dv.getInt16(4), 12345);
}
