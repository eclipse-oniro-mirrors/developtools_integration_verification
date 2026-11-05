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

// arktsid: typedarray_some_not_called_on_empty
// description: some does not invoke the predicate on an empty typed array and returns false
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(0);
    let cntI32: int = 0;
    let rI32 = taI32.some((v: number): boolean => { cntI32++; return true; });
    arktest.assertEQ(cntI32, 0, 'Int32Array some empty not called');
    arktest.assertFalse(rI32, 'Int32Array some empty returns false');
    let taU8 = new Uint8Array(0);
    let cntU8: int = 0;
    let rU8 = taU8.some((v: number): boolean => { cntU8++; return true; });
    arktest.assertEQ(cntU8, 0, 'Uint8Array some empty not called');
    arktest.assertFalse(rU8, 'Uint8Array some empty returns false');
    let taF64 = new Float64Array(0);
    let cntF64: int = 0;
    let rF64 = taF64.some((v: number): boolean => { cntF64++; return true; });
    arktest.assertEQ(cntF64, 0, 'Float64Array some empty not called');
    arktest.assertFalse(rF64, 'Float64Array some empty returns false');
}