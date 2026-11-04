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

// arktsid: reduceright_elements_deleted_throws
// description: Array.prototype.reduceRight throws TypeError when elements assigned values are deleted and initialValue
// is not present
// Conversion notes:
//  - The JS test deletes every element of [1, 2, 3, 4, 5] with `delete`, leaving no
//    present element. ArkTS has no `delete`, so the equivalent observable state is an
//    array emptied via length truncation; reduceRight without initialValue then throws
//    TypeError, asserted via try-catch.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 5];
    arr.length = 0;
    let caught: boolean = false;
    try {
        arr.reduceRight((prev: int, cur: int): int => prev + cur);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'reduceRight without initialValue after all elements deleted should throw TypeError');
}