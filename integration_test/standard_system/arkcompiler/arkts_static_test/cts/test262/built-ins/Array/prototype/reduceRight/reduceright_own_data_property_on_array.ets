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

// arktsid: reduceright_own_data_property_on_array
// description: Array.prototype.reduceRight - element to be retrieved is own data property on an Array
// Conversion notes:
//  - Reworked flag-pattern test to assert on reduceRight's return value.
//  - Original verified that at idx 1 the accumulator (prevVal) equals the last
//    element (2), i.e. reduceRight reads own data properties right-to-left with
//    the accumulator initialized to the last element.
//  - With (prev, cur) => prev - cur on [0, 1, 2]: acc starts at 2, then 2-1=1,
//    then 1-0=1. Result 1 confirms correct right-to-left iteration; any other
//    start/order would yield a different value. No initialValue; homogeneous int.

function main(): void {
    let arr: int[] = [0, 1, 2];
    let r: int = arr.reduceRight((prev: int, cur: int): int => { return prev - cur; });
    arktest.assertEQ(r, 1, '[0,1,2].reduceRight((p,c)=>p-c) => 2-1-0 = 1');
}