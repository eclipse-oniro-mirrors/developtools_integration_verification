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

// arktsid: array_from_elements_deleted_after
// description: Elements deleted after the call started and before visited are not visited
// Conversion notes:
//  - The JS mapFn tracks the visited index through the Array.from `this` thisArg;
//    ArkTS uses a closure counter instead (Array.from has no thisArg overload).
//  - ArkTS Array.from iterates the source live (ArrayValuesIterator re-reads
//    parent.length on each next()), so splicing the tail element stops the
//    iteration early, matching JS iterator semantics.

function main(): void {
    let original: int[] = [0, 1, -2, 4, -8, 16];
    let array: int[] = [0, 1, -2, 4, -8, 16];
    let arrayIndex: int = -1;

    let a: int[] = Array.from<int, int>(array, (value: int, index: int): int => {
        arrayIndex++;
        arktest.assertEQ(value, array[arrayIndex], 'value matches array[arrayIndex]');
        arktest.assertEQ(index, arrayIndex, 'index matches arrayIndex');
        array.splice(array.length - 1, 1);
        return 127;
    });

    arktest.assertEQ(a.length, original.length / 2, 'a.length is original.length / 2');
    for (let j: int = 0; j < original.length / 2; j++) {
        arktest.assertEQ(a[j], 127, 'a[j] is 127');
    }
}