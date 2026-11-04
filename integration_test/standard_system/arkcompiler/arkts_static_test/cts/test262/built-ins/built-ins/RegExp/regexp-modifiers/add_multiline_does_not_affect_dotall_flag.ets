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
// arktsid: add_multiline_does_not_affect_dotall_flag
// description: Adding multiline (`m`) modifier in group should not affect dotAll (`s`) flag.

function main(): void {
    let re1: RegExp = new RegExp('(?m:es.$)');
    arktest.assertTrue(re1.test('esz\n'), '$ should match newline in modified group');
    arktest.assertTrue(!re1.test('es\n\n'), '. should not match newline in modified group');

    let re2: RegExp = new RegExp('(?m:es.$)', 's');
    arktest.assertTrue(re2.test('esz\n'), '$ should match newline in modified group');
    arktest.assertTrue(re2.test('es\n\n'), '. should match newline in modified group');

    let re3: RegExp = new RegExp('(?m-:es.$)');
    arktest.assertTrue(re3.test('esz\n'), '$ should match newline in modified group');
    arktest.assertTrue(!re3.test('es\n\n'), '. should not match newline in modified group');

    let re4: RegExp = new RegExp('(?m-:es.$)', 's');
    arktest.assertTrue(re4.test('esz\n'), '$ should match newline in modified group');
    arktest.assertTrue(re4.test('es\n\n'), '. should match newline in modified group');
}