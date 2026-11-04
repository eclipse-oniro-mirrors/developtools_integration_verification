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

// arktsid: bufferarg_defined_length_and_offset
// description: new Int32Array(buffer, offset, length) with both offset and length
// Conversion notes: Int32Array used (BPE=4).

function main(): void {
    let buf = new ArrayBuffer(12);
    let a = new Int32Array(buf, 4, 2);
    arktest.assertEQ(a.length, 2, 'length');
    arktest.assertTrue(a.buffer === buf, 'buffer');
}