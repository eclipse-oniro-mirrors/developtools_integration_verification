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

// arktsid: character_class_word_class_escape_negative_cases
// description: Check negative cases of word class escape \w. \w must not match non-word characters.
// Conversion notes: test262 builds a huge non-word code point string and expects /\w/ to find no
//   match. Simplified here to representative non-word characters across standard/u/v modes.

function main(): void {
    // \w must not match symbols or whitespace (standard mode)
    let rStd: RegExp = new RegExp('\\w', '');
    arktest.assertTrue(!rStd.test(' '), '\\w does not match space (standard)');
    arktest.assertTrue(!rStd.test('!'), '\\w does not match ! (standard)');
    arktest.assertTrue(!rStd.test('-'), '\\w does not match - (standard)');
    arktest.assertTrue(!rStd.test('.'), '\\w does not match . (standard)');

    // \w must not match non-word in unicode mode
    let rU: RegExp = new RegExp('\\w', 'u');
    arktest.assertTrue(!rU.test('@'), '\\w does not match @ (unicode)');
    arktest.assertTrue(!rU.test('+'), '\\w does not match + (unicode)');

    // \w must not match non-word in v mode
    let rV: RegExp = new RegExp('\\w', 'v');
    arktest.assertTrue(!rV.test('#'), '\\w does not match # (v)');

    // A non-word string contains no \w match
    arktest.assertTrue(!new RegExp('\\w', '').test(' !@#'), '\\w finds no match in  !@#');
}