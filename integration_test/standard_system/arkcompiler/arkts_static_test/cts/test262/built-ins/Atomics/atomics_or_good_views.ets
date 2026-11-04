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
// arktsid: atomics_or_good_views
// description: Atomics.or operates on all integer TypedArray view types
// Conversion notes: SharedArrayBuffer replaced with ArrayBuffer; the test262 harness loop over view constructors is
// unrolled into one block per integer view type.

function main(): void {
    let vInt8Array = new Int8Array(new ArrayBuffer(16));
    vInt8Array[0] = 10;
    arktest.assertEQ(Atomics.or(vInt8Array, 0, 3), 10, 'Int8Array returns previous value');
    arktest.assertEQ(vInt8Array[0], 11, 'Int8Array new value');
    let vUint8Array = new Uint8Array(new ArrayBuffer(16));
    vUint8Array[0] = 10;
    arktest.assertEQ(Atomics.or(vUint8Array, 0, 3), 10, 'Uint8Array returns previous value');
    arktest.assertEQ(vUint8Array[0], 11, 'Uint8Array new value');
    let vInt16Array = new Int16Array(new ArrayBuffer(16));
    vInt16Array[0] = 10;
    arktest.assertEQ(Atomics.or(vInt16Array, 0, 3), 10, 'Int16Array returns previous value');
    arktest.assertEQ(vInt16Array[0], 11, 'Int16Array new value');
    let vUint16Array = new Uint16Array(new ArrayBuffer(16));
    vUint16Array[0] = 10;
    arktest.assertEQ(Atomics.or(vUint16Array, 0, 3), 10, 'Uint16Array returns previous value');
    arktest.assertEQ(vUint16Array[0], 11, 'Uint16Array new value');
    let vInt32Array = new Int32Array(new ArrayBuffer(16));
    vInt32Array[0] = 10;
    arktest.assertEQ(Atomics.or(vInt32Array, 0, 3), 10, 'Int32Array returns previous value');
    arktest.assertEQ(vInt32Array[0], 11, 'Int32Array new value');
    let vUint32Array = new Uint32Array(new ArrayBuffer(16));
    vUint32Array[0] = 10;
    arktest.assertEQ(Atomics.or(vUint32Array, 0, 3), 10, 'Uint32Array returns previous value');
    arktest.assertEQ(vUint32Array[0], 11, 'Uint32Array new value');
}