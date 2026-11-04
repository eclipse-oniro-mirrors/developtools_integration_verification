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

// arktsid: bigint64array_bufferarg_defined_offset
// description: new BigInt64Array(buffer, offset) constructs a view starting at the byte offset
// Conversion notes: BigInt64Array used (BPE=8).

function main(): void {
    let buf = new ArrayBuffer(32);
    let a = new BigInt64Array(buf, 16);
    arktest.assertEQ(a.length, 2, 'length');
    arktest.assertTrue(a.buffer === buf, 'buffer');
}