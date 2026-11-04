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

// arktsid: character_class_word_class_escape_positive_cases
// description: Check positive cases of word class escape \w. \w matches [a-zA-Z0-9_].
// Conversion notes: test262 enumerates all word code points via buildString(). Simplified here to
//   representative word characters (letters, digits, underscore) across standard/u/v modes.

function main(): void {
    // \w matches ASCII letters, digits, and underscore (standard mode)
    let rStd: RegExp = new RegExp('\\w', '');
    arktest.assertTrue(rStd.test('a'), '\\w matches a (standard)');
    arktest.assertTrue(rStd.test('Z'), '\\w matches Z (standard)');
    arktest.assertTrue(rStd.test('0'), '\\w matches 0 (standard)');
    arktest.assertTrue(rStd.test('9'), '\\w matches 9 (standard)');
    arktest.assertTrue(rStd.test('_'), '\\w matches _ (standard)');

    // \w matches word characters in unicode mode
    let rU: RegExp = new RegExp('\\w', 'u');
    arktest.assertTrue(rU.test('x'), '\\w matches x (unicode)');

    // \w matches word characters in v mode
    let rV: RegExp = new RegExp('\\w', 'v');
    arktest.assertTrue(rV.test('5'), '\\w matches 5 (v)');

    // Anchored /^\w+$/ fully matches a word string, in all three modes
    let word: string = 'abc_123';
    arktest.assertTrue(new RegExp('^\\w+$', '').test(word), '^\\w+$ matches abc_123 (standard)');
    arktest.assertTrue(new RegExp('^\\w+$', 'u').test(word), '^\\w+$ matches abc_123 (unicode)');
}