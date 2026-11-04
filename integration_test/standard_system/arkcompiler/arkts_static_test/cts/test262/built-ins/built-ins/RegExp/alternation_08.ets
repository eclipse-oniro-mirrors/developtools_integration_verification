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

// arktsid: alternation_08
// description: Execute /(?:ab|cd)+|ef/i.exec("AEKFCD") and check results
// Conversion notes:
//  - case-insensitive alternation "(?:ab|cd)+|ef" matches "CD" at index 4 of "AEKFCD";
//    the non-capturing group yields a single-element match array.

function main(): void {
    let r: RegExp = new RegExp('(?:ab|cd)+|ef', 'i');
    let result: RegExpExecArray | null = r.exec('AEKFCD');
    if (result != null) {
        arktest.assertEQ(result.length, 1, '__executed.length');
        arktest.assertEQ(result.index, 4, '__executed.index');
        arktest.assertEQ(result.input, 'AEKFCD', '__executed.input');
        arktest.assertEQ(result[0], 'CD', '__executed[0]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}