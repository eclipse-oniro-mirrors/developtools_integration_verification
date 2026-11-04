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

// arktsid: filter_subclassed_array_length_reduced
// description: Array.prototype.filter - subclassed array when length is reduced
// Conversion notes:
//  - The JS test builds a prototype-subclassed array of [1,2,3] whose length is reduced
//    to 1, then filter() returns a new array with that single kept element. ArkTS has no
//    JS prototype subclassing, so the observable behavior is tested on a plain length-1
//    array [1].

function main(): void {
    let src: int[] = [1];
    let a: int[] = src.filter((_v: int, idx: int, arr: int[]): boolean => {
        return true;
    });
    arktest.assertTrue(Array.isArray(a), 'Array.isArray(a) !== true');
    arktest.assertEQ(a.length, 1, 'a.length');
}