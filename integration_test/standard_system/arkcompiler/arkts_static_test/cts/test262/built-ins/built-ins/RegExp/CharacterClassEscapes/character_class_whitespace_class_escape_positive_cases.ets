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

// arktsid: character_class_whitespace_class_escape_positive_cases
// description: Check positive cases of whitespace class escape \s. \s matches WhiteSpace and LineTerminator.
// Conversion notes: test262 enumerates all whitespace code points via buildString(). Simplified here
//   to representative ASCII whitespace characters across standard/u/v modes.

function main(): void {
    // \s matches ASCII whitespace characters (standard mode)
    let rStd: RegExp = new RegExp('\\s', '');
    arktest.assertTrue(rStd.test(' '), '\\s matches space (standard)');
    arktest.assertTrue(rStd.test('\t'), '\\s matches tab (standard)');
    arktest.assertTrue(rStd.test('\n'), '\\s matches newline (standard)');
    arktest.assertTrue(rStd.test('\r'), '\\s matches CR (standard)');

    // \s matches whitespace in unicode mode
    let rU: RegExp = new RegExp('\\s', 'u');
    arktest.assertTrue(rU.test('\f'), '\\s matches form-feed (unicode)');

    // \s matches whitespace in v mode
    let rV: RegExp = new RegExp('\\s', 'v');
    arktest.assertTrue(rV.test('\v'), '\\s matches vertical-tab (v)');

    // Anchored /^\s+$/ fully matches a whitespace string, in all three modes
    let ws: string = ' \t\f';
    arktest.assertTrue(new RegExp('^\\s+$', '').test(ws), '^\\s+$ matches whitespace (standard)');
    arktest.assertTrue(new RegExp('^\\s+$', 'u').test(ws), '^\\s+$ matches whitespace (unicode)');
    arktest.assertTrue(new RegExp('^\\s+$', 'v').test(ws), '^\\s+$ matches whitespace (v)');
}