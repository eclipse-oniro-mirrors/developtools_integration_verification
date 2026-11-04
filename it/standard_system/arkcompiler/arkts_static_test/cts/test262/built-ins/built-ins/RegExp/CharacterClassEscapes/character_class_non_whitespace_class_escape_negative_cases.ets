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

// arktsid: character_class_non_whitespace_class_escape_negative_cases
// description: Check negative cases of non-whitespace class escape \S. \S must not match whitespace.
// Conversion notes: test262 builds a whitespace-only code point string and expects /\S/ to find no
//   match. Simplified here to representative whitespace characters across standard/u/v modes.

function main(): void {
    // \S must not match whitespace (standard mode)
    let rStd: RegExp = new RegExp('\\S', '');
    arktest.assertTrue(!rStd.test(' '), '\\S does not match space (standard)');
    arktest.assertTrue(!rStd.test('\t'), '\\S does not match tab (standard)');
    arktest.assertTrue(!rStd.test('\n'), '\\S does not match newline (standard)');

    // \S must not match whitespace in unicode mode
    let rU: RegExp = new RegExp('\\S', 'u');
    arktest.assertTrue(!rU.test('\r'), '\\S does not match CR (unicode)');
    arktest.assertTrue(!rU.test('\f'), '\\S does not match form-feed (unicode)');

    // \S must not match whitespace in v mode
    let rV: RegExp = new RegExp('\\S', 'v');
    arktest.assertTrue(!rV.test('\v'), '\\S does not match vertical-tab (v)');

    // A whitespace-only string contains no \S match
    arktest.assertTrue(!new RegExp('\\S', '').test(' \t\n'), '\\S finds no match in whitespace string');
}