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

// arktsid: atom_dot_09
// description: Execute /.+/.exec("|\\[{]};:\"',<>.?/") and check results
// Conversion notes:
//  - `.` matches any character except the four line terminator characters; the
//    source string contains backslash and quote characters that must be escaped
//    in the ArkTS string literal but are matched as ordinary characters.

function main(): void {
    let r: RegExp = new RegExp('.+');
    let result: RegExpExecArray | null = r.exec('|\\[{]};:"\',<>.?/');
    if (result != null) {
        arktest.assertEQ(result.length, 1, '__executed.length');
        arktest.assertEQ(result.index, 0, '__executed.index');
        arktest.assertEQ(result.input, '|\\[{]};:"\',<>.?/', '__executed.input');
        arktest.assertEQ(result[0], '|\\[{]};:"\',<>.?/', '__executed[0]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}