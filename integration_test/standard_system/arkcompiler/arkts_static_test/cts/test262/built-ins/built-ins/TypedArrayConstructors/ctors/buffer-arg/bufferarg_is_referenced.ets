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

// arktsid: bufferarg_is_referenced
// description: multiple typed arrays can share the same buffer
// Conversion notes: Int32Array used.

function main(): void {
    let buf = new ArrayBuffer(4);
    let a = new Int32Array(buf);
    let b = new Int32Array(buf);
    arktest.assertTrue(a.buffer === b.buffer, 'shared buffer');
}