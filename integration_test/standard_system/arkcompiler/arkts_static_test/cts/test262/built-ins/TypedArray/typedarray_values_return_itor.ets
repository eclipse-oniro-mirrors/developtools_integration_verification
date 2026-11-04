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

// arktsid: typedarray_values_return_itor
// description: values returns an iterator over the element values
// Conversion notes: representative TypedArray types unrolled; BigInt values unboxed to bigint primitive before compare.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 0; taI32[1] = 42; taI32[2] = 64;
    let itI32 = taI32.values();
    arktest.assertEQ(itI32.next().value!.valueOf(), 0, 'Int32Array values 0');
    arktest.assertEQ(itI32.next().value!.valueOf(), 42, 'Int32Array values 1');
    arktest.assertEQ(itI32.next().value!.valueOf(), 64, 'Int32Array values 2');
    arktest.assertTrue(itI32.next().done, 'Int32Array values done');
    let taU8 = new Uint8Array(3);
    taU8[0] = 0; taU8[1] = 42; taU8[2] = 64;
    let itU8 = taU8.values();
    arktest.assertEQ(itU8.next().value!.valueOf(), 0, 'Uint8Array values 0');
    arktest.assertEQ(itU8.next().value!.valueOf(), 42, 'Uint8Array values 1');
    arktest.assertEQ(itU8.next().value!.valueOf(), 64, 'Uint8Array values 2');
    arktest.assertTrue(itU8.next().done, 'Uint8Array values done');
    let taF64 = new Float64Array(3);
    taF64[0] = 0; taF64[1] = 42; taF64[2] = 64;
    let itF64 = taF64.values();
    arktest.assertEQ(itF64.next().value!.valueOf(), 0, 'Float64Array values 0');
    arktest.assertEQ(itF64.next().value!.valueOf(), 42, 'Float64Array values 1');
    arktest.assertEQ(itF64.next().value!.valueOf(), 64, 'Float64Array values 2');
    arktest.assertTrue(itF64.next().done, 'Float64Array values done');
}