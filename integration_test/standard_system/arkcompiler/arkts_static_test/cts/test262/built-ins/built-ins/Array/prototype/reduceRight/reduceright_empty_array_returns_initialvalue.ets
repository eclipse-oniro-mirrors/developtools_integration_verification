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

// arktsid: reduceright_empty_array_returns_initialvalue
// description: Array.prototype.reduceRight returns initialValue when Array is empty and initialValue is present
// Conversion notes:
//  - The JS test builds `new Array(10)` (a length-10 array with no present
//    elements). ArkTS has no sparse arrays and `new Array<int>(10)` is the
//    single-element array [10], so the empty case is represented with [].
//  - reduceRight on an empty array with an initialValue returns that
//    initialValue (5); the callback is never invoked. U == int.

function main(): void {
    let arr: int[] = [];
    let r: int = arr.reduceRight<int>((prev: int, cur: int): int => prev + cur, 5);
    arktest.assertEQ(r, 5, 'empty array reduceRight(callbackfn, 5) returns initialValue');
}