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

// arktsid: reduce_empty_array_initial_value_callback_not_called
// description: Array.prototype.reduce - initialValue is returned if len is 0 and initialValue is present
// Conversion notes:
//  - Empty array literal [] with initialValue 3: callback is never invoked
//    (accessed stays false) and 3 is returned.

function main(): void {
    let accessed: boolean = false;
    let arr: int[] = [];
    let result: int = arr.reduce<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        accessed = true;
        return 0;
    }, 3);
    arktest.assertEQ(result, 3, '[].reduce(callbackfn, 3)');
    arktest.assertFalse(accessed, 'accessed');
}