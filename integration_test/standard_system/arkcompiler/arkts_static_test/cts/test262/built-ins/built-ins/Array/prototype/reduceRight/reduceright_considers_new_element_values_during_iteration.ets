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

// arktsid: reduceright_considers_new_element_values_during_iteration
// description: Array.prototype.reduceRight considers new value of elements in array after it is called
// Conversion notes:
//  - The callback mutates arr[3] and arr[0] during iteration; reduceRight
//    re-reads each element's live value per spec, so the final result is 13.
//    U == T == int; no initialValue. The captured `arr` binding is not
//    reassigned (only element indices are mutated), which ArkTS permits.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    let r: int = arr.reduceRight((prev: int, cur: int, idx: int): int => {
        arr[3] = -2;
        arr[0] = -1;
        return prev + cur;
    });
    arktest.assertEQ(r, 13, 'arr.reduceRight(callbackfn)');
}