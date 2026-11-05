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

// arktsid: typedarray_reduce_return_first_value_without_callbackfn
// description: reduce on a single-element typed array without an initial value returns the element and does not call
// the
// callback
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(1);
    taI32[0] = 42;
    let cntI32: int = 0;
    let rI32 = taI32.reduce((acc: number, v: number): number => { cntI32++; return acc + v; });
    arktest.assertEQ(rI32!.valueOf(), 42, 'Int32Array single reduce returns elem');
    arktest.assertEQ(cntI32, 0, 'Int32Array callback not called');
    let taU8 = new Uint8Array(1);
    taU8[0] = 42;
    let cntU8: int = 0;
    let rU8 = taU8.reduce((acc: number, v: number): number => { cntU8++; return acc + v; });
    arktest.assertEQ(rU8!.valueOf(), 42, 'Uint8Array single reduce returns elem');
    arktest.assertEQ(cntU8, 0, 'Uint8Array callback not called');
    let taF64 = new Float64Array(1);
    taF64[0] = 42;
    let cntF64: int = 0;
    let rF64 = taF64.reduce((acc: number, v: number): number => { cntF64++; return acc + v; });
    arktest.assertEQ(rF64!.valueOf(), 42, 'Float64Array single reduce returns elem');
    arktest.assertEQ(cntF64, 0, 'Float64Array callback not called');
}