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

// arktsid: typedarray_fill_relative_end
// description: fill(value, start, end) with positive, negative, and clamped end
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let aI32 = new Int32Array(4);
    aI32.fill(8, 0, 1);
    arktest.assertEQ(aI32[0]!.valueOf(), 8, 'Int32Array fill-rel-end 0');
    arktest.assertEQ(aI32[1]!.valueOf(), 0, 'Int32Array fill-rel-end 1');
    let bI32 = new Int32Array(4);
    bI32.fill(8, 0, -1);
    arktest.assertEQ(bI32[0]!.valueOf(), 8, 'Int32Array fill-rel-end neg 0');
    arktest.assertEQ(bI32[3]!.valueOf(), 0, 'Int32Array fill-rel-end neg 3');
    let cI32 = new Int32Array(4);
    cI32.fill(8, 0, 5);
    arktest.assertEQ(cI32[3]!.valueOf(), 8, 'Int32Array fill-rel-end clamp');
    let aU8 = new Uint8Array(4);
    aU8.fill(8, 0, 1);
    arktest.assertEQ(aU8[0]!.valueOf(), 8, 'Uint8Array fill-rel-end 0');
    arktest.assertEQ(aU8[1]!.valueOf(), 0, 'Uint8Array fill-rel-end 1');
    let bU8 = new Uint8Array(4);
    bU8.fill(8, 0, -1);
    arktest.assertEQ(bU8[0]!.valueOf(), 8, 'Uint8Array fill-rel-end neg 0');
    arktest.assertEQ(bU8[3]!.valueOf(), 0, 'Uint8Array fill-rel-end neg 3');
    let cU8 = new Uint8Array(4);
    cU8.fill(8, 0, 5);
    arktest.assertEQ(cU8[3]!.valueOf(), 8, 'Uint8Array fill-rel-end clamp');
    let aF64 = new Float64Array(4);
    aF64.fill(8, 0, 1);
    arktest.assertEQ(aF64[0]!.valueOf(), 8, 'Float64Array fill-rel-end 0');
    arktest.assertEQ(aF64[1]!.valueOf(), 0, 'Float64Array fill-rel-end 1');
    let bF64 = new Float64Array(4);
    bF64.fill(8, 0, -1);
    arktest.assertEQ(bF64[0]!.valueOf(), 8, 'Float64Array fill-rel-end neg 0');
    arktest.assertEQ(bF64[3]!.valueOf(), 0, 'Float64Array fill-rel-end neg 3');
    let cF64 = new Float64Array(4);
    cF64.fill(8, 0, 5);
    arktest.assertEQ(cF64[3]!.valueOf(), 8, 'Float64Array fill-rel-end clamp');
}