/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: without_dotall_unicode
// description: Without the dotAll flag, . does not match newlines in Unicode mode

function main(): void {
    // The behavior is the same regardless of the m flag
    let regexps: RegExp[] = [new RegExp('^.$', 'u'), new RegExp('^.$', 'um')];
    for (let i = 0; i < regexps.length; i++) {
        let r: RegExp = regexps[i];
        arktest.assertTrue(r.test('a'));
        arktest.assertTrue(r.test('3'));
        arktest.assertTrue(r.test('π'));
        arktest.assertTrue(r.test('‧'));
        arktest.assertTrue(r.test('\u0085'));
        arktest.assertTrue(r.test('\v'));
        arktest.assertTrue(r.test('\f'));
        arktest.assertTrue(r.test('᠎'));
        arktest.assertTrue(r.test('\u{10300}'));
        arktest.assertFalse(r.test('\n'));
        arktest.assertFalse(r.test('\r'));
        arktest.assertFalse(r.test('\u2028'));
        arktest.assertFalse(r.test('\u2029'));
        arktest.assertTrue(r.test('\uD800'));
        arktest.assertTrue(r.test('\uDFFF'));
    }
}