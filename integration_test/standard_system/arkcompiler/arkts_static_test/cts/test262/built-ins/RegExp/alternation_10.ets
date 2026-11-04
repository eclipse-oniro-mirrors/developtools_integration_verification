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

// arktsid: alternation_10
// description: Execute /(?:ab|cd)+|ef/i.exec("AEKeFCDab") and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("(?:ab|cd)+|ef", "i"); the non-capturing group (?:...) does
//    not add a group, so the case-insensitive match is "eF" (the "ef" alternative) at index 3.

function main(): void {
    let r: RegExp = new RegExp('(?:ab|cd)+|ef', 'i');
    let result: RegExpExecArray | null = r.exec('AEKeFCDab');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 3, 'index');
        arktest.assertEQ(result.input, 'AEKeFCDab', 'input');
        arktest.assertEQ(result[0], 'eF', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}