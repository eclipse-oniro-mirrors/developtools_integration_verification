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

// arktsid: reduce_ascending_order_string_concat_with_initial
// description: Array.prototype.reduce reduces the array in ascending order of indices(initialvalue present)
// Conversion notes:
//  - With initialValue "0", the accumulator starts at "0" and each element is
//    concatenated in ascending index order, yielding "012345".

function main(): void {
    let arr: string[] = ['1', '2', '3', '4', '5'];
    let result: string = arr.reduce<string>((prev: string, cur: string, idx: int, a: string[]): string => {
        return prev + cur;
    }, '0');
    arktest.assertEQ(result, '012345', 'srcArr.reduce(callbackfn, "0")');
}