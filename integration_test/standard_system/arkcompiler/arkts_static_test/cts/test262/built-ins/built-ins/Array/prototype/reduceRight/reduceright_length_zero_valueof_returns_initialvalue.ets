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

// arktsid: reduceright_length_zero_valueof_returns_initialvalue
// description: Array.prototype.reduceRight returns initialValue if 'length' is 0 and initialValue is present
// (subclassed
// Array, length overridden with obj with valueOf)
// Conversion notes:
//  - JS prototype subclassing and length overridden with a valueOf object are not
//    representable in ArkTS. The observable behavior (length coerces to 0,
//    initialValue present -> initialValue returned, callback never invoked) is tested
//    on an empty array.

function main(): void {
    let arr: int[] = [];
    let r: int = arr.reduceRight<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        return 0;
    }, 1);
    arktest.assertEQ(r, 1, 'arr.reduceRight(cb, 1) returns initialValue');
}