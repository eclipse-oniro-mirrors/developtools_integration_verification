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

// arktsid: typedarray_foreach_not_called_on_empty
// description: forEach does not invoke the callback on an empty typed array
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(0);
    let cntI32: int = 0;
    taI32.forEach((v: number, i: int) => { cntI32++; });
    arktest.assertEQ(cntI32, 0, 'Int32Array forEach empty not called');
    let taU8 = new Uint8Array(0);
    let cntU8: int = 0;
    taU8.forEach((v: number, i: int) => { cntU8++; });
    arktest.assertEQ(cntU8, 0, 'Uint8Array forEach empty not called');
    let taF64 = new Float64Array(0);
    let cntF64: int = 0;
    taF64.forEach((v: number, i: int) => { cntF64++; });
    arktest.assertEQ(cntF64, 0, 'Float64Array forEach empty not called');
}