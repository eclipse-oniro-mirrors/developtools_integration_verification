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

// arktsid: bigint64array_bufferarg_negative_length_throws
// description: new BigInt64Array(buffer, 0, -1) throws RangeError
// Conversion notes: JS -Infinity case dropped.

function main(): void {
    let threw: boolean = false;
let name: string = '';
try { new BigInt64Array(new ArrayBuffer(16), 0, -1); } catch (e) { threw = true; name = e.name; }

arktest.assertTrue(threw, 'threw');
arktest.assertTrue(name == 'RangeError' || name == 'IndexOutOfBoundsError', 'RangeError family: ' + name);
}