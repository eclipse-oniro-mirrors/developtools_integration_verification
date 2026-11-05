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

// arktsid: reduce_returns_initialvalue_empty_array
// description: Array.prototype.reduce returns initialvalue when Array is empty and initialValue is present
// Conversion notes:
//  - The JS test builds the empty array with new Array(10) (a length-10 array of holes).
//    ArkTS has no sparse arrays, so an empty array literal [] is used. With an
//    initialValue present, reduce returns it without invoking the callback.

function main(): void {
    let arr: int[] = [];
    let result: int = arr.reduce<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        return 0;
    }, 5);
    arktest.assertEQ(result, 5, 'arr.reduce(callbackfn, 5)');
}