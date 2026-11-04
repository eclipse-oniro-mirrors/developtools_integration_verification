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

// arktsid: reduce_does_not_visit_deleted_elements_length_decreased
// description: Array.prototype.reduce doesn't visit deleted elements when Array.length is decreased
// Conversion notes:
//  - The callback truncates the array to length 2 during iteration (arr.length = 2),
//    which ArkTS's length setter supports (shrinking only). reduce re-reads actualLength
//    on every step, so iteration stops after index 1 and the result is prev + cur ==
//    1 + 2 == 3, exactly as in the JS test.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    let result: int = arr.reduce((prev: int, cur: int): int => {
        arr.length = 2;
        return prev + cur;
    });
    arktest.assertEQ(result, 3, 'arr.reduce(callbackfn)');
}