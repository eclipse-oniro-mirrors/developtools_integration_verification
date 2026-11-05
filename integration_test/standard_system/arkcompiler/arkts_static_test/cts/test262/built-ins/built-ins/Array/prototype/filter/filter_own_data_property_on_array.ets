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

// arktsid: filter_own_data_property_on_array
// description: Array.prototype.filter - element to be retrieved is own data property on an Array
// Conversion notes:
//  - Callback rewritten as a typed arrow predicate (v: int, i: int) => boolean.
//    The original implicit undefined return on the idx !== 0 path (relied on JS
//    coercion to false) is replaced with an explicit `return false`; that path
//    is never exercised for the single-element array [11].

function main(): void {
    let newArr: int[] = [11].filter((v: int, i: int): boolean => {
        if (i === 0) {
            return v === 11;
        }
        return false;
    });
    arktest.assertEQ(newArr.length, 1, 'newArr.length');
    arktest.assertEQ(newArr[0], 11, 'newArr[0]');
}