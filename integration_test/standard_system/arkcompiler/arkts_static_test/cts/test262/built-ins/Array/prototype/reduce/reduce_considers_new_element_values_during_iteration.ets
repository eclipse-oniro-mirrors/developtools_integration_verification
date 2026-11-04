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

// arktsid: reduce_considers_new_element_values_during_iteration
// description: Array.prototype.reduce considers new value of elements in array after it is called
// Conversion notes:
//  - The callback mutates arr[3] and arr[4] during iteration; reduce re-reads
//    each element's live value per spec (Get(O, Pk) each step), so the final
//    result is 3. U == T == int; no initialValue. The captured `arr` binding is
//    not reassigned (only element indices are mutated), which ArkTS permits.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    let r: int = arr.reduce((prev: int, cur: int, idx: int): int => {
        arr[3] = -2;
        arr[4] = -1;
        return prev + cur;
    });
    arktest.assertEQ(r, 3, 'arr.reduce(callbackfn)');
}