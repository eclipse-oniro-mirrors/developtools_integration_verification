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

// arktsid: character_class_non_whitespace_class_escape_positive_cases
// description: Check positive cases of non-whitespace class escape \S. \S matches every non-whitespace char.
// Conversion notes: test262 enumerates all non-whitespace code points via buildString(). Simplified here
//   to representative non-whitespace characters across standard/u/v modes.

function main(): void {
    // \S matches non-whitespace characters (standard mode)
    let rStd: RegExp = new RegExp('\\S', '');
    arktest.assertTrue(rStd.test('a'), '\\S matches a (standard)');
    arktest.assertTrue(rStd.test('5'), '\\S matches 5 (standard)');
    arktest.assertTrue(rStd.test('!'), '\\S matches ! (standard)');

    // \S matches non-whitespace in unicode mode
    let rU: RegExp = new RegExp('\\S', 'u');
    arktest.assertTrue(rU.test('x'), '\\S matches x (unicode)');

    // \S matches non-whitespace in v mode
    let rV: RegExp = new RegExp('\\S', 'v');
    arktest.assertTrue(rV.test('-'), '\\S matches - (v)');

    // Anchored /^\S+$/ fully matches a non-whitespace string, in all three modes
    let word: string = 'abc123';
    arktest.assertTrue(new RegExp('^\\S+$', '').test(word), '^\\S+$ matches abc123 (standard)');
    arktest.assertTrue(new RegExp('^\\S+$', 'u').test(word), '^\\S+$ matches abc123 (unicode)');
    arktest.assertTrue(new RegExp('^\\S+$', 'v').test(word), '^\\S+$ matches abc123 (v)');
}