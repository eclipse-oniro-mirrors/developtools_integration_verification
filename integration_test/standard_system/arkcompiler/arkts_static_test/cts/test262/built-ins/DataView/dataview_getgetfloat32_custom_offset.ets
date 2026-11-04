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

// arktsid: dataview_getgetfloat32_custom_offset
// description: DataView.getgetFloat32 reads from custom byteOffset view
// Conversion notes: test262 B|direct, 1:1 migration. Custom offset
//   buffer offsets: 4..7 hold values, read via byteOffset view.

function main(): void {
let ab = new ArrayBuffer(8);
    let dv = new DataView(ab, 4);
    let view = new DataView(ab);
    view.setFloat32(4, 1.5);
    let f: double = dv.getFloat32(0);
    arktest.assertTrue(f > 1.4 && f < 1.6, 'getFloat32 custom offset');
}