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

// arktsid: reduce_elements_deleted_throws_typeerror
// description: Array.prototype.reduce throws TypeError when elements assigned values are deleted and initialValue
// is not
// description: Array.prototype.reduce throws TypeError when elements assigned values are deleted and initialValue
// is not
// present
// Conversion notes:
//  - The JS test removes every element with the `delete` operator, leaving an array of
//    holes that reduce skips, so it throws TypeError. ArkTS has no `delete` and no
//    sparse arrays, so the array is emptied with arr.length = 0 (length truncation).
//    reduce without an initialValue on the resulting empty array throws TypeError,
//    preserving the observable behavior.

function main(): void {
    let caught: boolean = false;
    let arr: int[] = [1, 2, 3, 4, 5];
    arr.length = 0;
    try {
        arr.reduce((prev: int, cur: int): int => prev + cur);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'reduce after deleting all elements should throw TypeError');
}