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
// arktsid: add_multiline_does_not_affect_ignorecase_flag
// description: Adding multiline (`m`) modifier in group should not affect ignoreCase (`i`) flag.

function main(): void {
    let re1: RegExp = new RegExp('(?m:es$)');
    arktest.assertTrue(re1.test('es'), 's should match s in modified group');
    arktest.assertTrue(!re1.test('eS'), 's should not match S in modified group');
    arktest.assertTrue(re1.test('es\nz'), '$ should match newline in modified group');
    arktest.assertTrue(!re1.test('eS\nz'), 's should not match S in modified group');

    let re2: RegExp = new RegExp('(?m:es$)', 'i');
    arktest.assertTrue(re2.test('es'), 's should match s in modified group');
    arktest.assertTrue(re2.test('eS'), 's should match S in modified group');
    arktest.assertTrue(re2.test('es\nz'), '$ should match newline in modified group');
    arktest.assertTrue(re2.test('eS\nz'), '$ should match newline in modified group');

    let re3: RegExp = new RegExp('(?m-:es$)');
    arktest.assertTrue(re3.test('es'), 's should match s in modified group');
    arktest.assertTrue(!re3.test('eS'), 's should not match S in modified group');
    arktest.assertTrue(re3.test('es\nz'), '$ should match newline in modified group');
    arktest.assertTrue(!re3.test('eS\nz'), 's should not match S in modified group');

    let re4: RegExp = new RegExp('(?m-:es$)', 'i');
    arktest.assertTrue(re4.test('es'), 's should match s in modified group');
    arktest.assertTrue(re4.test('eS'), 's should match S in modified group');
    arktest.assertTrue(re4.test('es\nz'), '$ should match newline in modified group');
    arktest.assertTrue(re4.test('eS\nz'), '$ should match newline in modified group');
}