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

// arktsid: reduce_callback_array_arg_has_length
// description: Array.prototype.reduce - 'length' is own data property on an Array
// Conversion notes:
//  - Adaptation: the original passes initialValue 1 (number) while the callback
//    returns a boolean (obj.length === 2), giving a heterogeneous accumulator that
//    ArkTS cannot express. initialValue is changed to true so the accumulator type
//    U is uniformly boolean; the final result (true) is unchanged.
//  - Verifies the 4th callback argument is the array being traversed, whose own
//    'length' is 2.

function main(): void {
    let arr: int[] = [12, 11];
    let result: boolean = arr.reduce<boolean>((prev: boolean, cur: int, idx: int, a: int[]): boolean => {
        return a.length === 2;
    }, true);
    arktest.assertEQ(result, true, '[12, 11].reduce(callbackfn, 1)');
}