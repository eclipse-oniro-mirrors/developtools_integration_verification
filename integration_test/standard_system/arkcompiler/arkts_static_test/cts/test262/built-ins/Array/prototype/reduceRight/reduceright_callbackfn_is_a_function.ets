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

// arktsid: reduceright_callbackfn_is_a_function
// description: Array.prototype.reduceRight - 'callbackfn' is a function
// Conversion notes:
//  - Homogeneous int array [11, 9] with initialValue 0; the callback
//    `accum += val; return accum` is equivalent to `prev + cur`. reduceRight sums
//    right-to-left: 0 + 9 = 9, then 9 + 11 = 20. U == T == int.

function main(): void {
    let arr: int[] = [11, 9];
    let initialValue: int = 0;
    let r: int = arr.reduceRight<int>((prev: int, cur: int): int => { return prev + cur; }, initialValue);
    arktest.assertEQ(r, 20, '[11, 9].reduceRight(callbackfn, initialValue)');
}