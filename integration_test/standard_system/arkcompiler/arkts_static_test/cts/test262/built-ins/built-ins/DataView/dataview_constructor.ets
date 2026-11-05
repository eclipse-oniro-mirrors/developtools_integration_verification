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

// arktsid: dataview_constructor
// description: DataView constructed with ArrayBuffer provides get/set methods for numeric types
// Migrated from test262: built-ins/DataView constructor and basic access tests

function main(): void {
    // Create ArrayBuffer and DataView
    let ab = new ArrayBuffer(16);
    let dv = new DataView(ab);

    // byteLength and byteOffset
    arktest.assertEQ(dv.byteLength, 16);
    arktest.assertEQ(dv.byteOffset, 0);

    // DataView with offset
    let dv2 = new DataView(ab, 4, 8);
    arktest.assertEQ(dv2.byteOffset, 4);
    arktest.assertEQ(dv2.byteLength, 8);

    // buffer property returns the underlying ArrayBuffer
    arktest.assertEQ(dv.buffer === ab, true);
}
