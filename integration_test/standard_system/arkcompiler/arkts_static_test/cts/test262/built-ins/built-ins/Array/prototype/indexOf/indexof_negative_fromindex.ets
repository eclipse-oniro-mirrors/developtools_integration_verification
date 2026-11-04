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

// arktsid: indexof_negative_fromindex
// description: Array.prototype.indexOf with negative fromIndex
// Conversion notes:
//  - Source used a.indexOf(1, -5.3) (float fromIndex); changed to -5. ArkTS fromIndex is int,
//    and JS ToInteger(-5.3) === -5, so the result is identical (clamps to 0, finds 1 at index 0).

function main(): void {
    let a: int[] = [1, 2, 3];
    arktest.assertEQ(a.indexOf(2, -1), -1, 'a.indexOf(2,-1)');
    arktest.assertEQ(a.indexOf(2, -2), 1, 'a.indexOf(2,-2)');
    arktest.assertEQ(a.indexOf(1, -3), 0, 'a.indexOf(1,-3)');
    arktest.assertEQ(a.indexOf(1, -5), 0, 'a.indexOf(1,-5)');
}