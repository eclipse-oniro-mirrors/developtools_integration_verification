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

// arktsid: character_class_non_digit_class_escape_negative_cases
// description: Check negative cases of non-digit class escape \D. \D must not match ASCII digits 0-9.
// Conversion notes: test262 builds a digit-only code point string and expects /\D/ to find no match.
//   Simplified here to representative digit assertions across standard/u/v modes.

function main(): void {
    // \D must not match ASCII digits (standard mode)
    let rStd: RegExp = new RegExp('\\D', '');
    arktest.assertTrue(!rStd.test('0'), '\\D does not match 0 (standard)');
    arktest.assertTrue(!rStd.test('5'), '\\D does not match 5 (standard)');
    arktest.assertTrue(!rStd.test('9'), '\\D does not match 9 (standard)');

    // \D must not match digits in unicode mode
    let rU: RegExp = new RegExp('\\D', 'u');
    arktest.assertTrue(!rU.test('3'), '\\D does not match 3 (unicode)');

    // \D must not match digits in v mode
    let rV: RegExp = new RegExp('\\D', 'v');
    arktest.assertTrue(!rV.test('7'), '\\D does not match 7 (v)');

    // A digit-only string does not contain any \D match
    arktest.assertTrue(!new RegExp('\\D', '').test('0123456789'), '\\D finds no match in 0123456789');
}