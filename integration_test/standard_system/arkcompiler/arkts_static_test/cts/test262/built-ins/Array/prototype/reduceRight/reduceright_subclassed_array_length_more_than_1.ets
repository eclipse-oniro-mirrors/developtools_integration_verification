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

// arktsid: reduceright_subclassed_array_length_more_than_1
// description: Array.prototype.reduceRight - subclassed array with length more than 1
// Conversion notes:
//  - JS prototype subclassing is not representable in ArkTS, so a plain [0, 1, 2, 3]
//    array is used. The callback sums prev + cur in descending order, giving
//    0 + 1 + 2 + 3 == 6.

function main(): void {
    let arr: int[] = [0, 1, 2, 3];
    let result: int = arr.reduceRight((prev: int, cur: int): int => prev + cur);
    arktest.assertEQ(result, 6, 'arr.reduceRight(cb)');
}