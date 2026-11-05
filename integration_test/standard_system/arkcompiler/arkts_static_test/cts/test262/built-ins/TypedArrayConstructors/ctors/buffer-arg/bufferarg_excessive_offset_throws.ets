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

// arktsid: bufferarg_excessive_offset_throws
// description: new Int32Array(buffer, 8) throws RangeError when offset exceeds buffer size
// Conversion notes: buffer size 4; offset 8 > 4.

function main(): void {
    let threw: boolean = false;
let name: string = '';
try { new Int32Array(new ArrayBuffer(4), 8); } catch (e) { threw = true; name = e.name; }

arktest.assertTrue(threw, 'threw');
arktest.assertTrue(name == 'RangeError' || name == 'IndexOutOfBoundsError', 'RangeError family: ' + name);
}