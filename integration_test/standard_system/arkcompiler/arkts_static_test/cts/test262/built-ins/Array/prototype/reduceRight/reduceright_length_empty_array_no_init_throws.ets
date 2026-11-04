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

// arktsid: reduceright_length_empty_array_no_init_throws
// description: Array.prototype.reduceRight throws TypeError if 'length' is 0 (subclassed Array, length overridden with
// []), no initVal
// Conversion notes:
//  - JS prototype subclassing and length overridden with an empty array (which coerces
//    to 0) are not representable in ArkTS. The observable contract (length 0, no
//    initialValue) is tested on an empty array: reduceRight without initialValue
//    throws TypeError, asserted via try-catch.

function main(): void {
    let arr: int[] = [];
    let caught: boolean = false;
    try {
        arr.reduceRight((prev: int, cur: int): int => prev + cur);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'reduceRight on length-0 array without initialValue should throw TypeError');
}