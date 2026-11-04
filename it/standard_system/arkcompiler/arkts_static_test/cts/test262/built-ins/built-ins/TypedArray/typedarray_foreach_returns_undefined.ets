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

// arktsid: typedarray_foreach_returns_undefined
// description: forEach invokes the callback once per element and returns undefined
// Conversion notes: representative TypedArray types unrolled; callback invocation counted.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    let cntI32: int = 0;
    taI32.forEach((v: number, i: int) => { cntI32++; });
    arktest.assertEQ(cntI32, 3, 'Int32Array forEach invoked 3 times');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    let cntU8: int = 0;
    taU8.forEach((v: number, i: int) => { cntU8++; });
    arktest.assertEQ(cntU8, 3, 'Uint8Array forEach invoked 3 times');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    let cntF64: int = 0;
    taF64.forEach((v: number, i: int) => { cntF64++; });
    arktest.assertEQ(cntF64, 3, 'Float64Array forEach invoked 3 times');
}