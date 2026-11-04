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

// arktsid: reduceright_k_values_descending_order
// description: Array.prototype.reduceRight - k values are passed in acending numeric order
// Conversion notes:
//  - reduceRight iterates right-to-left, so indices are visited in descending order;
//    the callback checks idx === lastIdx then decrements (5,4,3,2,1,0).
//  - The JS callback returns undefined; ArkTS requires an int return (U == int with
//    initialValue 1), so the callback returns cur. The return value is not asserted.
//  - Mutable flags (accessed, result) and lastIdx are captured and updated in the lambda.

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4, 5];
    let lastIdx: int = arr.length - 1;
    let accessed: boolean = false;
    let result: boolean = true;
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        accessed = true;
        if (lastIdx !== idx) {
            result = false;
        } else {
            lastIdx--;
        }
        return cur;
    }, 1);
    arktest.assertTrue(result, 'result !== true');
    arktest.assertTrue(accessed, 'accessed !== true');
}