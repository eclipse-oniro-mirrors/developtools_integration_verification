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

// arktsid: character_class_non_word_class_escape_negative_cases
// description: Check negative cases of non-word class escape \W. \W must not match [a-zA-Z0-9_].
// Conversion notes: test262 builds a word-only code point string and expects /\W/ to find no match.
//   Simplified here to representative word character assertions across standard/u/v modes.

function main(): void {
    // \W must not match ASCII letters, digits, or underscore (standard mode)
    let rStd: RegExp = new RegExp('\\W', '');
    arktest.assertTrue(!rStd.test('a'), '\\W does not match a (standard)');
    arktest.assertTrue(!rStd.test('Z'), '\\W does not match Z (standard)');
    arktest.assertTrue(!rStd.test('0'), '\\W does not match 0 (standard)');
    arktest.assertTrue(!rStd.test('_'), '\\W does not match _ (standard)');

    // \W must not match word characters in unicode mode
    let rU: RegExp = new RegExp('\\W', 'u');
    arktest.assertTrue(!rU.test('9'), '\\W does not match 9 (unicode)');

    // \W must not match word characters in v mode
    let rV: RegExp = new RegExp('\\W', 'v');
    arktest.assertTrue(!rV.test('x'), '\\W does not match x (v)');

    // A word-only string contains no \W match
    arktest.assertTrue(!new RegExp('\\W', '').test('abc_123'), '\\W finds no match in abc_123');
}