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
// arktsid: add_ignorecase_affects_characterclasses
// description: Adding ignoreCase (`i`) modifier in group affects character classes in group.

function main(): void {
    let re1 = new RegExp('(?i:[ab])c', '');
    arktest.assertTrue(re1.test('ac'));
    arktest.assertTrue(re1.test('Ac'));
    arktest.assertTrue(re1.test('bc'));
    arktest.assertTrue(re1.test('Bc'));

    let re2 = new RegExp('(?i-:[ab])c', '');
    arktest.assertTrue(re2.test('ac'));
    arktest.assertTrue(re2.test('Ac'));
    arktest.assertTrue(re2.test('bc'));
    arktest.assertTrue(re2.test('Bc'));

    let re3 = new RegExp('(?i:[^ab])c', '');
    arktest.assertTrue(!re3.test('ac'));
    arktest.assertTrue(!re3.test('Ac'));
    arktest.assertTrue(!re3.test('bc'));
    arktest.assertTrue(!re3.test('Bc'));

    let re4 = new RegExp('(?i-:[^ab])c', '');
    arktest.assertTrue(!re4.test('ac'));
    arktest.assertTrue(!re4.test('Ac'));
    arktest.assertTrue(!re4.test('bc'));
    arktest.assertTrue(!re4.test('Bc'));
}