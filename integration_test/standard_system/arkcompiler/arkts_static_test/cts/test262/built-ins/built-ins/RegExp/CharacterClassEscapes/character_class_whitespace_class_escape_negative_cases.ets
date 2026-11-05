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

// arktsid: character_class_whitespace_class_escape_negative_cases
// description: Check negative cases of whitespace class escape \s. \s must not match non-whitespace.
// Conversion notes: test262 builds a huge non-whitespace code point string and expects /\s/ to find
//   no match. Simplified here to representative non-whitespace characters across standard/u/v modes.

function main(): void {
    // \s must not match non-whitespace (standard mode)
    let rStd: RegExp = new RegExp('\\s', '');
    arktest.assertTrue(!rStd.test('a'), '\\s does not match a (standard)');
    arktest.assertTrue(!rStd.test('5'), '\\s does not match 5 (standard)');
    arktest.assertTrue(!rStd.test('!'), '\\s does not match ! (standard)');

    // \s must not match non-whitespace in unicode mode
    let rU: RegExp = new RegExp('\\s', 'u');
    arktest.assertTrue(!rU.test('x'), '\\s does not match x (unicode)');
    arktest.assertTrue(!rU.test('.'), '\\s does not match . (unicode)');

    // \s must not match non-whitespace in v mode
    let rV: RegExp = new RegExp('\\s', 'v');
    arktest.assertTrue(!rV.test('-'), '\\s does not match - (v)');
    arktest.assertTrue(!rV.test('@'), '\\s does not match @ (v)');

    // A non-whitespace string contains no \s match
    arktest.assertTrue(!new RegExp('\\s', '').test('abc123'), '\\s finds no match in abc123');
}