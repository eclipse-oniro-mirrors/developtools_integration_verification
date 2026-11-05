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

// arktsid: foreach_considers_new_element_value
// description: Array.prototype.forEach - considers new value of elements in array after the call
// Conversion notes:
//  - The callback mutates arr[4] = 6 on every invocation; forEach re-reads the live
//    element value at each index, so when iteration reaches index 4 the callback
//    observes the updated value 6. This matches the spec Get(O, Pk) per-iteration read.
//  - Mutable result flag declared as boolean and set inside the callback.
//  - Integer literals [1..5] typed as Array<int>.

function main(): void {
    let result: boolean = false;
    let arr: int[] = [1, 2, 3, 4, 5];
    arr.forEach((v: int): void => {
        arr[4] = 6;
        if (v >= 6) {
            result = true;
        }
    });
    arktest.assertEQ(result, true, 'result !== true');
}