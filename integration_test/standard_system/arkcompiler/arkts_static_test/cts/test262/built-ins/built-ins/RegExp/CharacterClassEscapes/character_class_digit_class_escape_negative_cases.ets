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

// arktsid: character_class_digit_class_escape_negative_cases
// description: Check negative cases of digit class escape \d. \d must not match non-digit characters.
// Conversion notes: test262 builds a huge non-digit code point string and expects /\d/ to find no
//   match. Simplified here to representative non-digit characters across standard/u/v modes.

function main(): void {
    // \d must not match letters, whitespace, or symbols (standard mode)
    let rStd: RegExp = new RegExp('\\d', '');
    arktest.assertTrue(!rStd.test('a'), '\\d does not match a (standard)');
    arktest.assertTrue(!rStd.test('Z'), '\\d does not match Z (standard)');
    arktest.assertTrue(!rStd.test(' '), '\\d does not match space (standard)');
    arktest.assertTrue(!rStd.test('!'), '\\d does not match ! (standard)');

    // \d must not match non-digits in unicode mode
    let rU: RegExp = new RegExp('\\d', 'u');
    arktest.assertTrue(!rU.test('x'), '\\d does not match x (unicode)');
    arktest.assertTrue(!rU.test('-'), '\\d does not match - (unicode)');

    // \d must not match non-digits in v mode
    let rV: RegExp = new RegExp('\\d', 'v');
    arktest.assertTrue(!rV.test('.'), '\\d does not match . (v)');
    arktest.assertTrue(!rV.test('@'), '\\d does not match @ (v)');
}