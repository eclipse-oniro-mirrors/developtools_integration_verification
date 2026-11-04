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

// arktsid: some_length_decreased_during_iteration
// description: Array.prototype.some doesn't visit deleted elements when Array.length is decreased
// Conversion notes:
//  - The callback truncates arr.length = 3 during the first iteration; ArkTS some
//    captures len once but re-checks this.actualLength in the loop condition, so
//    after truncation iteration stops at index 3 and the tail (4, 6) is not visited.
//    All visited values (1, 2, 3) are < 4, so the callback always returns false and
//    some returns false.
//  - `delete` is unavailable in ArkTS, but the equivalent spec behavior (shrinking
//    length drops trailing elements) is reproduced via the length setter.

function main(): void {
    let arr: int[] = [1, 2, 3, 4, 6];
    let result: boolean = arr.some((val: int, _idx: int): boolean => {
        arr.length = 3;
        if (val < 4) {
            return false;
        }
        return true;
    });
    arktest.assertEQ(result, false, 'arr.some(callbackfn)');
}