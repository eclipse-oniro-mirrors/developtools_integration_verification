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

// arktsid: filter_length_own_data_property
// description: Array.prototype.filter - 'length' is own data property on an Array
// Conversion notes:
//  - Named callbackfn(val, idx, obj) became a typed arrow predicate; the third
//    parameter (the array) is used to read length, mirroring obj.length. The
//    value/index parameters are unused (prefixed with _).

function main(): void {
    let srcArr: int[] = [12, 11];
    let newArr: int[] = srcArr.filter((_v: int, _i: int, a: int[]): boolean => { return a.length === 2; });
    arktest.assertEQ(newArr.length, 2, 'newArr.length');
}