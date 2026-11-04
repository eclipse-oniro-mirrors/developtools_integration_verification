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

// arktsid: reduce_empty_array_with_initial_value
// description: Array.prototype.reduce returns initialValue when length is 0 and initialValue is present (empty array)
// Conversion notes:
//  - Empty array literal [] with an initialValue: the callback is never invoked
//    and the initialValue (1) is returned.

function main(): void {
    let arr: int[] = [];
    let result: int = arr.reduce<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        return 0;
    }, 1);
    arktest.assertEQ(result, 1, '[].reduce(cb, 1)');
}