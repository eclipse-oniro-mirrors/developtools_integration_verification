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

// arktsid: map_own_data_property_on_array
// description: Array.prototype.map - element to be retrieved is own data property on an Array
// Conversion notes:
//  - Source object literal {} replaced with new Object() (ArkTS does not support
//    untyped object literals). The callback verifies the element received at
//    index 0 is the exact kValue reference (=== identity), returning boolean;
//    map therefore produces an Array<boolean> whose first element is true.
//  - Callback rewritten as a typed arrow function (v: Object, i: int) => boolean.

function main(): void {
    let kValue: Object = {};
    let arr: Object[] = [kValue];
    let newArr: boolean[] = arr.map((val: Object, idx: int): boolean => {
        if (idx === 0) {
            return val === kValue;
        }
        return false;
    });
    arktest.assertEQ(newArr[0], true, 'newArr[0]');
}