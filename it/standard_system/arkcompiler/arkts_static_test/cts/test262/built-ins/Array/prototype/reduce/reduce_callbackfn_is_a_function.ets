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

// arktsid: reduce_callbackfn_is_a_function
// description: Array.prototype.reduce - callbackfn is a function
// Conversion notes:
//  - Adaptation: the original passes initialValue 1 (number) while the callback
//    returns a boolean (curVal > 10), giving a heterogeneous accumulator that
//    ArkTS cannot express. initialValue is changed to true so the accumulator
//    type U is uniformly boolean. The callback ignores prev, so both the final
//    result (false) and the accessed flag are unchanged from the original.

function main(): void {
    let accessed: boolean = false;
    let arr: int[] = [11, 9];
    let result: boolean = arr.reduce<boolean>((prev: boolean, cur: int, idx: int, a: int[]): boolean => {
        accessed = true;
        return cur > 10;
    }, true);
    arktest.assertEQ(result, false, '[11, 9].reduce(callbackfn, 1)');
    arktest.assertTrue(accessed, 'accessed');
}