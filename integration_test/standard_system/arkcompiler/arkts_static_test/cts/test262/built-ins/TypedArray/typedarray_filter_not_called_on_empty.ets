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

// arktsid: typedarray_filter_not_called_on_empty
// description: filter does not invoke the callback on an empty typed array
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(0);
    let cntI32: int = 0;
    let rI32 = taI32.filter((v: number): boolean => { cntI32++; return true; });
    arktest.assertEQ(cntI32, 0, 'Int32Array filter empty not called');
    arktest.assertEQ(rI32.length, 0, 'Int32Array filter empty length');
    let taU8 = new Uint8Array(0);
    let cntU8: int = 0;
    let rU8 = taU8.filter((v: number): boolean => { cntU8++; return true; });
    arktest.assertEQ(cntU8, 0, 'Uint8Array filter empty not called');
    arktest.assertEQ(rU8.length, 0, 'Uint8Array filter empty length');
    let taF64 = new Float64Array(0);
    let cntF64: int = 0;
    let rF64 = taF64.filter((v: number): boolean => { cntF64++; return true; });
    arktest.assertEQ(cntF64, 0, 'Float64Array filter empty not called');
    arktest.assertEQ(rF64.length, 0, 'Float64Array filter empty length');
}