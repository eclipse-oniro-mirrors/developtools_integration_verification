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

// arktsid: reduceright_does_not_consider_deleted_elements_length_decreased
// description: Array.prototype.reduceRight doesn't consider unvisited deleted elements when Array.length is decreased
// Conversion notes:
//  - The callback truncates the array to length 2 during iteration (arr.length = 2).
//    ArkTS's length setter supports shrinking and reduceRight re-checks actualLength at
//    each step, so indices at/after the new length are skipped and the accumulated
//    result is prev + cur == 12, matching the JS test.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    let result: int = arr.reduceRight((prev: int, cur: int): int => {
        arr.length = 2;
        return prev + cur;
    });
    arktest.assertEQ(result, 12, 'arr.reduceRight(callbackfn)');
}