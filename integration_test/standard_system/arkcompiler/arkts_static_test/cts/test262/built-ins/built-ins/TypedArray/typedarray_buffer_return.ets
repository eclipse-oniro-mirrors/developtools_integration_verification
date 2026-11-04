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

// arktsid: typedarray_buffer_return
// description: TypedArray.prototype.buffer returns the backing ArrayBuffer
// Conversion notes: SharedArrayBuffer replaced with ArrayBuffer; representative TypedArray types unrolled.

function main(): void {
    let abI32 = new ArrayBuffer(64);
    let taI32 = new Int32Array(abI32);
    arktest.assertTrue(taI32.buffer === abI32, 'Int32Array buffer');
    let abU8 = new ArrayBuffer(64);
    let taU8 = new Uint8Array(abU8);
    arktest.assertTrue(taU8.buffer === abU8, 'Uint8Array buffer');
    let abF64 = new ArrayBuffer(64);
    let taF64 = new Float64Array(abF64);
    arktest.assertTrue(taF64.buffer === abF64, 'Float64Array buffer');
}