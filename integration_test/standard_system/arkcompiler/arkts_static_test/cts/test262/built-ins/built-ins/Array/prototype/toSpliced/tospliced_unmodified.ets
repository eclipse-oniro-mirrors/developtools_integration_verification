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

// arktsid: tospliced_unmodified
// description: toSpliced(1, 0) returns a copy equal to the original array

function main(): void {
    let arr: int[] = [1, 2, 3];
    let spliced: int[] = arr.toSpliced(1, 0);
    arktest.assertTrue(spliced !== arr, 'spliced is a new array');
    arktest.assertEQ(spliced.length, 3, 'spliced length');
    arktest.assertEQ(spliced[0], 1, 'spliced[0]');
    arktest.assertEQ(spliced[1], 2, 'spliced[1]');
    arktest.assertEQ(spliced[2], 3, 'spliced[2]');
}