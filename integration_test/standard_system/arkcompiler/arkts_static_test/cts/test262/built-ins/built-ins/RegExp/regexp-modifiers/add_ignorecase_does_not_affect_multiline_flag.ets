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
// arktsid: add_ignorecase_does_not_affect_multiline_flag
// description: Adding ignoreCase (`i`) modifier in group should not affect multiline (`m`) flag.

function main(): void {
    let re1 = new RegExp('(?i:es$)', '');
    arktest.assertTrue(re1.test('es'));
    arktest.assertTrue(re1.test('eS'));
    arktest.assertTrue(!re1.test('es\nz'));
    arktest.assertTrue(!re1.test('eS\nz'));

    let re2 = new RegExp('(?i:es$)', 'm');
    arktest.assertTrue(re2.test('es'));
    arktest.assertTrue(re2.test('eS'));
    arktest.assertTrue(re2.test('es\nz'));
    arktest.assertTrue(re2.test('eS\nz'));

    let re3 = new RegExp('(?i-:es$)', '');
    arktest.assertTrue(re3.test('es'));
    arktest.assertTrue(re3.test('eS'));
    arktest.assertTrue(!re3.test('es\nz'));
    arktest.assertTrue(!re3.test('eS\nz'));

    let re4 = new RegExp('(?i-:es$)', 'm');
    arktest.assertTrue(re4.test('es'));
    arktest.assertTrue(re4.test('eS'));
    arktest.assertTrue(re4.test('es\nz'));
    arktest.assertTrue(re4.test('eS\nz'));
}