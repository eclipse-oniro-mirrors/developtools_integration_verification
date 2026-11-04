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
// arktsid: atomics_add_expected_return_value
// description: Atomics.add adds value to element and returns the previous value
// Conversion notes: SharedArrayBuffer replaced with ArrayBuffer; the operation works on a plain TypedArray view.

function main(): void {
    let ab = new ArrayBuffer(16);
    let arr = new Int32Array(ab);
    arr[0] = 10;
    let r = Atomics.add(arr, 0, 3);
    arktest.assertEQ(r, 10, 'returns the previous value');
    arktest.assertEQ(arr[0], 13, 'new value at index');
}