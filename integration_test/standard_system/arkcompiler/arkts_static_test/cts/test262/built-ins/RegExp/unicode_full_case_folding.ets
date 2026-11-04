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

// arktsid: unicode_full_case_folding
// description: Case-insensitive Unicode RegExps should not apply full case folding mappings
// Conversion notes:
//  - Unicode 15.1 added simple case-folding (S) mappings (1FD3->0390, 1FE3->03B0, FB05->FB06),
//    so under `ui` the character class and the input canonicalize to the same code point
//    and test() returns true. Result depends on the engine's CaseFolding table; verified at runtime.

function main(): void {
    arktest.assertTrue(new RegExp('[\\u0390]', 'ui').test('ΐ'), '\\u0390 does not match \\u1fd3');
    arktest.assertTrue(new RegExp('[\\u1fd3]', 'ui').test('ΐ'), '\\u1fd3 does not match \\u0390');
    arktest.assertTrue(new RegExp('[\\u03b0]', 'ui').test('ΰ'), '\\u03b0 does not match \\u1fe3');
    arktest.assertTrue(new RegExp('[\\u1fe3]', 'ui').test('ΰ'), '\\u1fe3 does not match \\u03b0');
    arktest.assertTrue(new RegExp('[\\ufb05]', 'ui').test('ﬆ'), '\\ufb05 does not match \\ufb06');
    arktest.assertTrue(new RegExp('[\\ufb06]', 'ui').test('ﬅ'), '\\ufb06 does not match \\ufb05');
}