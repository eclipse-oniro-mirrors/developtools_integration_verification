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

// arktsid: tospliced_zero_args_copy
// description: Array.prototype.toSpliced with zero arguments returns a copy of the array

function main(): void {
    let arr: String[] = ['first', 'second', 'third'];
    let result: String[] = arr.toSpliced();

    // Result is a new array (not the same reference)
    arktest.assertTrue(result !== arr, 'toSpliced() returns a new array');

    // Content is identical
    arktest.assertEQ(result.length, arr.length, 'result length');
    for (let i: int = 0; i < arr.length; i++) {
        arktest.assertEQ(result[i], arr[i], 'element ' + i);
    }
}