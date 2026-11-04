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

// arktsid: typedarray_from_mapfn_arguments
// description: TypedArray.from passes (value, index) to mapfn on each element
// Conversion notes: Dropped arguments.length assertions (arguments unsupported). Source typed Array<number>.

function main(): void {
    let src: number[] = [42, 43, 44];
    let kValues: number[] = [];
    let ks: number[] = [];
    Int32Array.from(src, (v: number, k: number): number => {
        kValues.push(v);
        ks.push(k);
        return v;
    });
    arktest.assertEQ(kValues.length, 3, 'call count');
    arktest.assertEQ(kValues[0], 42, 'kValue 0');
    arktest.assertEQ(ks[0], 0, 'k 0');
    arktest.assertEQ(kValues[2], 44, 'kValue 2');
    arktest.assertEQ(ks[2], 2, 'k 2');
}