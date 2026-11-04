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

// arktsid: reduceright_length_own_data_property_on_array
// description: Array.prototype.reduceRight - 'length' is own data property on an Array
// Conversion notes:
//  - Calls reduceRight directly on a homogeneous int array [12, 11] with initialValue 11.
//  - Original callback returns a boolean (obj.length === 2) while initialValue is int,
//    so the JS accumulator is heterogeneous. Reworked to a typed int accumulator
//    (U == T == int) returning 1 when the 4th arg (the array) has length 2, else 0.
//    Result is deterministic.
//  - Verifies the callback runs and receives the original array (length 2) as 4th arg.

function main(): void {
    let arr: int[] = [12, 11];
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        return a.length == 2 ? 1 : 0;
    }, 11);
    arktest.assertEQ(r, 1, '[12, 11].reduceRight(callbackfn, 11) - 4th arg is array with length 2');
}