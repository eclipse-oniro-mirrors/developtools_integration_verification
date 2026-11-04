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

// arktsid: word_boundary
// description: Word boundary
// Conversion notes:
//  - \b (word boundary) and \B (non-boundary) assertions combined with lookbehind
//    (?<=...) are evaluated at the current match position, independent of the
//    lookbehind's backward direction.

function checkMatch(subject: String, pattern: String, expected: String[], label: String): void {
    let m: RegExpMatchArray | null = new RegExp(pattern).match(subject);
    arktest.assertTrue(m != null, label + ': expected a match');
    if (m != null) {
        arktest.assertEQ(m.length, expected.length, label + ' (length)');
        for (let i = 0; i < expected.length; i++) {
            arktest.assertEQ(m[i], expected[i], label + ' (index ' + i + ')');
        }
    }
}

function main(): void {
    checkMatch('abc def', '(?<=\\b)[d-f]{3}', ['def'], '#1');
    checkMatch('ab cdef', '(?<=\\B)\\w{3}', ['def'], '#2');
    checkMatch('ab cdef', '(?<=\\B)(?<=c(?<=\\w))\\w{3}', ['def'], '#3');

    arktest.assertEQ('abcdef'.match(new RegExp('(?<=\\b)[d-f]{3}')), null, '#4');
}