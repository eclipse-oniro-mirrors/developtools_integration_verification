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

// arktsid: typedarray_keys_return_itor
// description: keys returns an iterator over the indices
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    let itI32 = taI32.keys();
    arktest.assertEQ(itI32.next().value, 0, 'Int32Array keys 0');
    arktest.assertEQ(itI32.next().value, 1, 'Int32Array keys 1');
    arktest.assertEQ(itI32.next().value, 2, 'Int32Array keys 2');
    arktest.assertTrue(itI32.next().done, 'Int32Array keys done');
    let taU8 = new Uint8Array(3);
    let itU8 = taU8.keys();
    arktest.assertEQ(itU8.next().value, 0, 'Uint8Array keys 0');
    arktest.assertEQ(itU8.next().value, 1, 'Uint8Array keys 1');
    arktest.assertEQ(itU8.next().value, 2, 'Uint8Array keys 2');
    arktest.assertTrue(itU8.next().done, 'Uint8Array keys done');
    let taF64 = new Float64Array(3);
    let itF64 = taF64.keys();
    arktest.assertEQ(itF64.next().value, 0, 'Float64Array keys 0');
    arktest.assertEQ(itF64.next().value, 1, 'Float64Array keys 1');
    arktest.assertEQ(itF64.next().value, 2, 'Float64Array keys 2');
    arktest.assertTrue(itF64.next().done, 'Float64Array keys done');
}