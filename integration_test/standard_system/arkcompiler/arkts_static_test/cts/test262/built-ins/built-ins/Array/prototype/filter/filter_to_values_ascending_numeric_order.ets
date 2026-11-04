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

// arktsid: filter_to_values_ascending_numeric_order
// description: Array.prototype.filter - values of 'to' are passed in ascending numeric order
// Conversion notes:
//  - Callback captures and mutates outer state (lastToIdx, called) to verify
//    elements are visited in ascending index order. Unused value param
//    prefixed with _.

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4];
    let lastToIdx: int = 0;
    let called: int = 0;
    let newArr: int[] = arr.filter((_val: int, idx: int): boolean => {
        called++;
        if (lastToIdx !== idx) {
            return false;
        } else {
            lastToIdx++;
            return true;
        }
    });
    arktest.assertEQ(newArr.length, 5, 'newArr.length');
    arktest.assertEQ(called, 5, 'called');
}