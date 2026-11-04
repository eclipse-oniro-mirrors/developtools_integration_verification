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

// arktsid: array_from_elements_updated_after
// description: Elements are updated in the source array after the call to from started but before visited
// Conversion notes:
//  - ArkTS Array.from iterates the source Array live (no snapshot), so in-bounds
//    mutations to not-yet-visited elements are visible, matching JS semantics

function main(): void {
    let array: int[] = [127, 4, 8, 16, 32, 64, 128];
    let arrayIndex: int = -1;

    let a: int[] = Array.from<int, int>(array, (value: int, index: int): int => {
        arrayIndex++;
        if (index + 1 < array.length) {
            array[index + 1] = 127;
        }
        arktest.assertEQ(value, 127, 'value is 127');
        arktest.assertEQ(index, arrayIndex, 'index === arrayIndex');
        return value;
    });

    arktest.assertEQ(a.length, array.length, 'a.length === array.length');
    for (let j: int = 0; j < a.length; j++) {
        arktest.assertEQ(a[j], 127, 'a[j] === 127');
    }
}