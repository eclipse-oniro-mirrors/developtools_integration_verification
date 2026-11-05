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

// arktsid: typedarray_find_predicate_call_changes_value
// description: find reads live values; mutating a later element during the predicate is visible to subsequent calls
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 1; taI32[1] = 2; taI32[2] = 3;
    let rI32 = taI32.find((v: number, i: int): boolean => {
        if (i == 0) { taI32[2] = 7; }
        return v == 7;
    });
    arktest.assertEQ(rI32!.valueOf(), 7, 'Int32Array find sees mutated value');
    let ta2I32 = new Int32Array(3);
    ta2I32[0] = 1; ta2I32[1] = 2; ta2I32[2] = 3;
    let r2I32 = ta2I32.find((v: number, i: int): boolean => {
        if (i == 0) { ta2I32[2] = 7; }
        return v == 3;
    });
    arktest.assertTrue(r2I32 === undefined, 'Int32Array find original value gone after mutation');
    let taU8 = new Uint8Array(3);
    taU8[0] = 1; taU8[1] = 2; taU8[2] = 3;
    let rU8 = taU8.find((v: number, i: int): boolean => {
        if (i == 0) { taU8[2] = 7; }
        return v == 7;
    });
    arktest.assertEQ(rU8!.valueOf(), 7, 'Uint8Array find sees mutated value');
    let ta2U8 = new Uint8Array(3);
    ta2U8[0] = 1; ta2U8[1] = 2; ta2U8[2] = 3;
    let r2U8 = ta2U8.find((v: number, i: int): boolean => {
        if (i == 0) { ta2U8[2] = 7; }
        return v == 3;
    });
    arktest.assertTrue(r2U8 === undefined, 'Uint8Array find original value gone after mutation');
    let taF64 = new Float64Array(3);
    taF64[0] = 1; taF64[1] = 2; taF64[2] = 3;
    let rF64 = taF64.find((v: number, i: int): boolean => {
        if (i == 0) { taF64[2] = 7; }
        return v == 7;
    });
    arktest.assertEQ(rF64!.valueOf(), 7, 'Float64Array find sees mutated value');
    let ta2F64 = new Float64Array(3);
    ta2F64[0] = 1; ta2F64[1] = 2; ta2F64[2] = 3;
    let r2F64 = ta2F64.find((v: number, i: int): boolean => {
        if (i == 0) { ta2F64[2] = 7; }
        return v == 3;
    });
    arktest.assertTrue(r2F64 === undefined, 'Float64Array find original value gone after mutation');
}