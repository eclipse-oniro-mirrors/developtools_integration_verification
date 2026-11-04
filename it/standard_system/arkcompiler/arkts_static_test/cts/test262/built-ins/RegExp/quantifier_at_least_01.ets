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

// arktsid: quantifier_at_least_01
// description: Execute /b{2,}c/.exec("aaabbbbcccddeeeefffff") and check results
// Conversion notes:
//  - {2,} matches two or more occurrences of the preceding atom "b", so /b{2,}c/ matches "bbbbc" at index 3.

function main(): void {
    let r: RegExp = new RegExp('b{2,}c');
    let result: RegExpExecArray | null = r.exec('aaabbbbcccddeeeefffff');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 3, 'index');
        arktest.assertEQ(result.input, 'aaabbbbcccddeeeefffff', 'input');
        arktest.assertEQ(result[0], 'bbbbc', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}