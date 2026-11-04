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

// arktsid: alternation_15
// description: The | operator separates alternatives; exec on "Hi Bob" matches "Bob" with unmatched groups undefined
// Conversion notes:
//  - unmatched alternation capture groups yield undefined elements in the exec result array

function main(): void {
    let r: RegExp = new RegExp('(Rob)|(Bob)|(Robert)|(Bobby)');
    let m: RegExpExecArray | null = r.exec('Hi Bob');
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 5, 'length');
    arktest.assertEQ(m.index, 3, 'index');
    arktest.assertEQ(m.input, 'Hi Bob', 'input');
    arktest.assertEQ(m[0], 'Bob', 'group 0');
    arktest.assertEQ(m[1], undefined, 'group 1 (Rob) unmatched');
    arktest.assertEQ(m[2], 'Bob', 'group 2 (Bob) matched');
    arktest.assertEQ(m[3], undefined, 'group 3 (Robert) unmatched');
    arktest.assertEQ(m[4], undefined, 'group 4 (Bobby) unmatched');
}