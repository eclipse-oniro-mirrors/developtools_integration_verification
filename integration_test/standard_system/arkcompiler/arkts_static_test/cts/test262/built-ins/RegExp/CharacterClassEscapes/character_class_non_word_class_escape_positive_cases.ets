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

// arktsid: character_class_non_word_class_escape_positive_cases
// description: Check positive cases of non-word class escape \W. \W matches every non-word character.
// Conversion notes: test262 enumerates all non-word code points via buildString(). Simplified here
//   to representative non-word characters across standard/u/v modes.

function main(): void {
    // \W matches non-word characters (standard mode)
    let rStd: RegExp = new RegExp('\\W', '');
    arktest.assertTrue(rStd.test(' '), '\\W matches space (standard)');
    arktest.assertTrue(rStd.test('!'), '\\W matches ! (standard)');
    arktest.assertTrue(rStd.test('-'), '\\W matches - (standard)');
    arktest.assertTrue(rStd.test('.'), '\\W matches . (standard)');

    // \W matches non-word in unicode mode
    let rU: RegExp = new RegExp('\\W', 'u');
    arktest.assertTrue(rU.test('@'), '\\W matches @ (unicode)');

    // \W matches non-word in v mode
    let rV: RegExp = new RegExp('\\W', 'v');
    arktest.assertTrue(rV.test('#'), '\\W matches # (v)');

    // Anchored /^\W+$/ fully matches a non-word string, in all three modes
    let sym: string = ' !@#';
    arktest.assertTrue(new RegExp('^\\W+$', '').test(sym), '^\\W+$ matches  !@# (standard)');
    arktest.assertTrue(new RegExp('^\\W+$', 'u').test(sym), '^\\W+$ matches  !@# (unicode)');
    arktest.assertTrue(new RegExp('^\\W+$', 'v').test(sym), '^\\W+$ matches  !@# (v)');
}