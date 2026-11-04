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
// arktsid: atomics_store_expected_return_value_negative_zero
// description: Atomics.store normalizes -0 to +0 and returns the normalized value
// Conversion notes: Object.is(-0, +0) is false in JS, but store normalizes -0 to +0; in ArkTS the returned long equals
// 0.

function main(): void {
    let ab = new ArrayBuffer(16);
    let arr = new Int32Array(ab);
    arr[0] = 99;
    let r = Atomics.store(arr, 0, -0);
    arktest.assertEQ(r, 0, 'store(-0) returns +0');
    arktest.assertEQ(arr[0], 0, 'stored value is normalized to +0');
}