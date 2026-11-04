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

// arktsid: tospliced_start_zero_deletecount_zero
// description: Array.prototype.toSpliced(0, 0) returns a copy of the original array without modifying it
// Conversion notes: test262 uses `toSpliced(undefined, undefined)` to test JS coercion of
//   undefined→0. ArkTS uses explicit `toSpliced(0, 0)` and checks the returned array is not
//   the same reference (ArkTS arrays are always value-copied by toSpliced).

function main(): void {
    let arr: String[] = ['first', 'second', 'third'];
    let result: String[] = arr.toSpliced(0, 0);

    // Verify result matches original content
    arktest.assertEQ(result.length, 3, 'result length');
    arktest.assertEQ(result[0], 'first', 'result[0]');
    arktest.assertEQ(result[1], 'second', 'result[1]');
    arktest.assertEQ(result[2], 'third', 'result[2]');

    // Verify result is not the same array instance (toSpliced always returns new array)
    arktest.assertTrue(result !== arr, 'result is a new array');
}