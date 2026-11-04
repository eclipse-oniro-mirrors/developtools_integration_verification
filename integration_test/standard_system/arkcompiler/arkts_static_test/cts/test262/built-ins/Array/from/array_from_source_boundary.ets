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

// arktsid: array_from_source_boundary
// description: Array.from with boundary values (MAX/MIN/NaN/±Infinity) preserved through mapFn

function main(): void {
    let array: number[] = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.NaN,
        Number.NEGATIVE_INFINITY,
        Number.POSITIVE_INFINITY
    ];
    let arrayIndex: int = -1;

    let a: number[] = Array.from<number, number>(array, (value: number, index: int): number => {
        arrayIndex++;
        // NaN cannot use ===, use isNaN
        if (arrayIndex == 2) {
            arktest.assertTrue(Number.isNaN(value), 'value at index 2 is NaN');
        } else {
            arktest.assertEQ(value, array[arrayIndex], 'value matches source');
        }
        arktest.assertEQ(index, arrayIndex, 'index matches counter');
        return value;
    });

    arktest.assertEQ(a.length, array.length, 'result length');
    arktest.assertEQ(a[0], Number.MAX_VALUE, 'a[0]');
    arktest.assertEQ(a[1], Number.MIN_VALUE, 'a[1]');
    arktest.assertTrue(Number.isNaN(a[2]), 'a[2] is NaN');
    arktest.assertEQ(a[3], Number.NEGATIVE_INFINITY, 'a[3]');
    arktest.assertEQ(a[4], Number.POSITIVE_INFINITY, 'a[4]');
}