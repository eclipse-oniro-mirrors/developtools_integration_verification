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

// arktsid: dataview_is_constructor
// description: DataView is a constructor — new DataView() creates a DataView instance

function main(): void {
    // DataView can be constructed with new
    let buf: ArrayBuffer = new ArrayBuffer(8);
    let view: DataView = new DataView(buf);
    arktest.assertEQ(view.byteLength, 8, 'new DataView(buf) creates DataView with byteLength 8');
}