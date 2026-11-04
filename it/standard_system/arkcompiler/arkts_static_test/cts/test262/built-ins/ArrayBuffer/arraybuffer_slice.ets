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

// arktsid: arraybuffer_slice
// description: ArrayBuffer.prototype.slice returns a new ArrayBuffer with copied bytes
// Migrated from test262: built-ins/ArrayBuffer slice tests

function main(): void {
    // Create buffer and slice
    let ab = new ArrayBuffer(10);
    let sliced = ab.slice(0, 5);
    arktest.assertEQ(sliced.byteLength, 5);

    // Slice from middle
    let sliced2 = ab.slice(3, 8);
    arktest.assertEQ(sliced2.byteLength, 5);

    // Slice with only begin (to end)
    let sliced3 = ab.slice(4);
    arktest.assertEQ(sliced3.byteLength, 6);

    // Slice returns different instance
    arktest.assertEQ(sliced !== ab, true);
}
