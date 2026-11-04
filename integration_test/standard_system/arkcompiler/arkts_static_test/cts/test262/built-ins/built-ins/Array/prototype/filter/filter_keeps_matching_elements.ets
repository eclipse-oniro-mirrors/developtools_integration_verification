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

// arktsid: filter_keeps_matching_elements
// description: Array.prototype.filter - callbackfn is a function

function main(): void {
    let newArr: int[] = [11, 9].filter((val: int, idx: int): boolean => {
        if (idx === 1) {
            return val === 9;
        }
        return false;
    });
    arktest.assertEQ(newArr.length, 1, 'newArr.length');
    arktest.assertEQ(newArr[0], 9, 'newArr[0]');
}