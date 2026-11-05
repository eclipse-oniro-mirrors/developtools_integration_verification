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

// arktsid: negative_lookbehind
// description: RegExp negative lookbehind
// Conversion notes:
//  - Negative lookbehind (?<!...) matches only when the sub-pattern does NOT
//    match the text immediately before the current position.

function checkMatch(subject: String, pattern: String, expected: String[], label: String): void {
    let m: RegExpMatchArray | null = subject.match(new RegExp(pattern));
    arktest.assertTrue(m != null, label + ': expected a match');
    if (m != null) {
        arktest.assertEQ(m.length, expected.length, label + ' (length)');
        for (let i = 0; i < expected.length; i++) {
            arktest.assertEQ(m[i], expected[i], label + ' (index ' + i + ')');
        }
    }
}

function checkNoMatch(subject: String, pattern: String, label: String): void {
    arktest.assertEQ(subject.match(new RegExp(pattern)), null, label);
}

function main(): void {
    checkMatch('abcdef', '(?<!abc)\\w\\w\\w', ['abc'], '#1');
    checkMatch('abcdef', '(?<!a.c)\\w\\w\\w', ['abc'], '#2');
    checkMatch('abcdef', '(?<!a\\wc)\\w\\w\\w', ['abc'], '#3');
    checkMatch('abcdef', '(?<!a[a-z])\\w\\w\\w', ['abc'], '#4');
    checkMatch('abcdef', '(?<!a[a-z]{2})\\w\\w\\w', ['abc'], '#5');
    checkNoMatch('abcdef', '(?<!abc)def', '#6');
    checkNoMatch('abcdef', '(?<!a.c)def', '#7');
    checkNoMatch('abcdef', '(?<!a\\wc)def', '#8');
    checkNoMatch('abcdef', '(?<!a[a-z][a-z])def', '#9');
    checkNoMatch('abcdef', '(?<!a[a-z]{2})def', '#10');
    checkNoMatch('abcdef', '(?<!a{1}b{1})cde', '#11');
    checkNoMatch('abcdef', '(?<!a{1}[a-z]{2})def', '#12');
}