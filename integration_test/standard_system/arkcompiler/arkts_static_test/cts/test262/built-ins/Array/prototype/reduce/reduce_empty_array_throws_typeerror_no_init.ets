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

// arktsid: reduce_empty_array_throws_typeerror_no_init
// description: Array.prototype.reduce throws TypeError when Array is empty and initialValue is not present
// Conversion notes:
//  - The JS test builds the empty array with new Array(10) (a length-10 array of holes).
//    ArkTS has no sparse arrays and its single-argument Array constructor is
//    element-valued, so an empty array literal [] is used. reduce without an
//    initialValue on an empty array throws TypeError, matching the JS behavior.

function main(): void {
    let caught: boolean = false;
    let arr: int[] = [];
    try {
        arr.reduce((prev: int, cur: int): int => prev + cur);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'reduce on empty array without initialValue should throw');
}