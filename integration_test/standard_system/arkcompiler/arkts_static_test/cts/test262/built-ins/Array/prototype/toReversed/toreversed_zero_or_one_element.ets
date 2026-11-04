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

// arktsid: toreversed_zero_or_one_element
// description: toReversed returns a new array for zero- or one-element arrays

function main(): void {
    let zero: int[] = [];
    let zeroReversed: int[] = zero.toReversed();
    arktest.assertTrue(zeroReversed !== zero, 'zero: new array');
    arktest.assertEQ(zeroReversed.length, 0, 'zero: length 0');

    let one: int[] = [1];
    let oneReversed: int[] = one.toReversed();
    arktest.assertTrue(oneReversed !== one, 'one: new array');
    arktest.assertEQ(oneReversed.length, 1, 'one: length 1');
    arktest.assertEQ(oneReversed[0], 1, 'one: element unchanged');
}