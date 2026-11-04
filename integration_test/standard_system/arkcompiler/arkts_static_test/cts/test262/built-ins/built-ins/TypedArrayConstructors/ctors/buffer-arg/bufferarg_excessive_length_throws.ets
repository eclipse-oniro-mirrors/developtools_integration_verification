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

// arktsid: bufferarg_excessive_length_throws
// description: new Int32Array(buffer, 0, 2) throws RangeError when offset+length exceeds buffer
// Conversion notes: Int32Array BPE=4; 0+2*4=8 > buffer size 4.

function main(): void {
    let threw: boolean = false;
let name: string = '';
try { new Int32Array(new ArrayBuffer(4), 0, 2); } catch (e) { threw = true; name = e.name; }

arktest.assertTrue(threw, 'threw');
arktest.assertTrue(name == 'RangeError' || name == 'IndexOutOfBoundsError', 'RangeError family: ' + name);
}