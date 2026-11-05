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

// arktsid: reduceright_returns_initialvalue_when_length_zero
// description: Array.prototype.reduceRight - 'initialValue' is returned if 'len' is 0 and 'initialValue' is present
// Conversion notes:
//  - Empty int array with initialValue 10; the callback is never invoked
//    (length is 0), so reduceRight returns the initialValue. U == T == int.

function main(): void {
    let arr: int[] = [];
    let r: int = arr.reduceRight<int>((prev: int, cur: int): int => { return 0; }, 10);
    arktest.assertEQ(r, 10, '[].reduceRight(fn, 10) returns initialValue');
}