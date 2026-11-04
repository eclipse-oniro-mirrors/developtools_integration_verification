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

// arktsid: character_class_digit_class_escape_positive_cases
// description: Check positive cases of digit class escape \d. \d matches the ten ASCII digits 0-9.
// Conversion notes: test262 enumerates all code points via buildString(). Simplified here to
//   representative ASCII digit assertions across standard/u/v modes.

function main(): void {
    // \d matches each ASCII digit in standard mode
    let rStd: RegExp = new RegExp('\\d', '');
    arktest.assertTrue(rStd.test('0'), '\\d matches 0 (standard)');
    arktest.assertTrue(rStd.test('5'), '\\d matches 5 (standard)');
    arktest.assertTrue(rStd.test('9'), '\\d matches 9 (standard)');

    // \d matches digits in unicode mode
    let rU: RegExp = new RegExp('\\d', 'u');
    arktest.assertTrue(rU.test('3'), '\\d matches 3 (unicode)');

    // \d matches digits in v mode
    let rV: RegExp = new RegExp('\\d', 'v');
    arktest.assertTrue(rV.test('7'), '\\d matches 7 (v)');

    // Anchored /^\d+$/ fully matches a string of all ten digits, in all three modes
    let allDigits: string = '0123456789';
    arktest.assertTrue(new RegExp('^\\d+$', '').test(allDigits), '^\\d+$ matches 0123456789 (standard)');
    arktest.assertTrue(new RegExp('^\\d+$', 'u').test(allDigits), '^\\d+$ matches 0123456789 (unicode)');
    arktest.assertTrue(new RegExp('^\\d+$', 'v').test(allDigits), '^\\d+$ matches 0123456789 (v)');

    // A non-digit inside the string breaks the anchored full match
    arktest.assertTrue(!new RegExp('^\\d+$', '').test('12a45'), '^\\d+$ does not match 12a45');
}