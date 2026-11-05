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

// arktsid: every_considers_new_element_values_during_iteration
// description: Array.prototype.every considers new value of elements in array after the call
// Conversion notes:
//  - The callback mutates arr[4] = 6 during iteration; every re-reads each
//    element's live value per spec (Get(O, Pk) each step), so when iteration
//    reaches index 4 the value is 6 and 6 < 6 is false, making every return
//    false. The captured `arr` binding is not reassigned (only an element
//    index is mutated), which ArkTS permits.
//  - Callback rewritten as a typed arrow predicate (val: int, idx: int) => boolean.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    let result: boolean = arr.every((val: int, _idx: int): boolean => {
        arr[4] = 6;
        return val < 6;
    });
    arktest.assertEQ(result, false, 'arr.every(callbackfn)');
}