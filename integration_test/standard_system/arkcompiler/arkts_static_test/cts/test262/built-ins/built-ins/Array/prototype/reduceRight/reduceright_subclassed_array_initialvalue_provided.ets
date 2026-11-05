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

// arktsid: reduceright_subclassed_array_initialvalue_provided
// description: Array.prototype.reduceRight - subclassed array when initialvalue provided
// Conversion notes:
//  - JS prototype subclassing is not representable in ArkTS, so a plain [0, 1, 2, 3]
//    array is used. The initialValue is the string "4" and the callback concatenates
//    prev + cur, so the accumulator type U is string while the element type is int;
//    this is expressed with the generic reduceRight<U>. The result "43210" matches the
//    JS behavior.

function main(): void {
    let arr: int[] = [0, 1, 2, 3];
    let result: string = arr.reduceRight<string>((prev: string, cur: int): string => prev + cur, '4');
    arktest.assertEQ(result, '43210', "arr.reduceRight(cb, '4')");
}