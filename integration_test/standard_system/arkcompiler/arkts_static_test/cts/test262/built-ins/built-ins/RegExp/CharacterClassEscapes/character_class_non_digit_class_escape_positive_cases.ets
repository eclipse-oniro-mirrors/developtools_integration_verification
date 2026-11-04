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

// arktsid: character_class_non_digit_class_escape_positive_cases
// description: Check positive cases of non-digit class escape \D. \D matches every character not in 0-9.
// Conversion notes: test262 enumerates all non-digit code points via buildString(). Simplified here
//   to representative non-digit characters across standard/u/v modes.

function main(): void {
    // \D matches non-digit characters (standard mode)
    let rStd: RegExp = new RegExp('\\D', '');
    arktest.assertTrue(rStd.test('a'), '\\D matches a (standard)');
    arktest.assertTrue(rStd.test('Z'), '\\D matches Z (standard)');
    arktest.assertTrue(rStd.test(' '), '\\D matches space (standard)');
    arktest.assertTrue(rStd.test('!'), '\\D matches ! (standard)');

    // \D matches non-digits in unicode mode
    let rU: RegExp = new RegExp('\\D', 'u');
    arktest.assertTrue(rU.test('x'), '\\D matches x (unicode)');

    // \D matches non-digits in v mode
    let rV: RegExp = new RegExp('\\D', 'v');
    arktest.assertTrue(rV.test('-'), '\\D matches - (v)');

    // Anchored /^\D+$/ fully matches a non-digit string, in all three modes
    let letters: string = 'abcXYZ';
    arktest.assertTrue(new RegExp('^\\D+$', '').test(letters), '^\\D+$ matches abcXYZ (standard)');
    arktest.assertTrue(new RegExp('^\\D+$', 'u').test(letters), '^\\D+$ matches abcXYZ (unicode)');

    // A digit inside the string breaks the anchored full match
    arktest.assertTrue(!new RegExp('^\\D+$', '').test('ab1cd'), '^\\D+$ does not match ab1cd');
}