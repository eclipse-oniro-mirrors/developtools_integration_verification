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

// arktsid: typedarray_find_predicate_call_parameters
// description: find calls the predicate with (value, index, array) for each entry
// Conversion notes: test262 arguments-object capture replaced with named params. Representative TypedArray types
// unrolled.

function main(): void {
    let taI32 = new Int32Array(3);
    taI32[0] = 39; taI32[1] = 2; taI32[2] = 62;
    let cntI32: int = 0;
    let v0I32: number = 0;
    let i0I32: int = -1;
    let arr0I32: Int32Array = taI32;
    taI32.find((v: number, i: int, arr: Int32Array): boolean => {
        if (cntI32 == 0) { v0I32 = v.valueOf(); i0I32 = i; arr0I32 = arr; }
        cntI32++;
        return false;
    });
    arktest.assertEQ(cntI32, 3, 'Int32Array find called 3 times');
    arktest.assertEQ(v0I32, 39, 'Int32Array find first value');
    arktest.assertEQ(i0I32, 0, 'Int32Array find first index');
    arktest.assertTrue(arr0I32 === taI32, 'Int32Array find array arg');
    let taU8 = new Uint8Array(3);
    taU8[0] = 39; taU8[1] = 2; taU8[2] = 62;
    let cntU8: int = 0;
    let v0U8: number = 0;
    let i0U8: int = -1;
    let arr0U8: Uint8Array = taU8;
    taU8.find((v: number, i: int, arr: Uint8Array): boolean => {
        if (cntU8 == 0) { v0U8 = v.valueOf(); i0U8 = i; arr0U8 = arr; }
        cntU8++;
        return false;
    });
    arktest.assertEQ(cntU8, 3, 'Uint8Array find called 3 times');
    arktest.assertEQ(v0U8, 39, 'Uint8Array find first value');
    arktest.assertEQ(i0U8, 0, 'Uint8Array find first index');
    arktest.assertTrue(arr0U8 === taU8, 'Uint8Array find array arg');
    let taF64 = new Float64Array(3);
    taF64[0] = 39; taF64[1] = 2; taF64[2] = 62;
    let cntF64: int = 0;
    let v0F64: number = 0;
    let i0F64: int = -1;
    let arr0F64: Float64Array = taF64;
    taF64.find((v: number, i: int, arr: Float64Array): boolean => {
        if (cntF64 == 0) { v0F64 = v.valueOf(); i0F64 = i; arr0F64 = arr; }
        cntF64++;
        return false;
    });
    arktest.assertEQ(cntF64, 3, 'Float64Array find called 3 times');
    arktest.assertEQ(v0F64, 39, 'Float64Array find first value');
    arktest.assertEQ(i0F64, 0, 'Float64Array find first index');
    arktest.assertTrue(arr0F64 === taF64, 'Float64Array find array arg');
}