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

// arktsid: bigint64array_bufferarg_shares_buffer
// description: multiple BigInt64Arrays can share the same buffer
// Conversion notes: BigInt64Array used.

function main(): void {
    let buf = new ArrayBuffer(8);
    let a1 = new BigInt64Array(buf);
    let a2 = new BigInt64Array(buf);
    arktest.assertTrue(a1.buffer === buf && a2.buffer === buf, 'shared buffer');
}