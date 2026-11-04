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
// arktsid: atomics_xor_bad_range
// description: Atomics.xor throws RangeError when the index is out of bounds
// Conversion notes: Out-of-bounds index raises a runtime RangeError, asserted via try/catch.

function main(): void {
    let ab = new ArrayBuffer(4);
    let arr = new Int32Array(ab);
    arr[0] = 5;
    let threw: boolean = false;
    let name: string = '';
    try {
        Atomics.xor(arr, 5, 10);
    } catch (e) {
        threw = true;
        name = e.name;
    }
    arktest.assertTrue(threw, 'threw on out-of-bounds index');
    arktest.assertEQ(name, 'RangeError', 'error name');
}