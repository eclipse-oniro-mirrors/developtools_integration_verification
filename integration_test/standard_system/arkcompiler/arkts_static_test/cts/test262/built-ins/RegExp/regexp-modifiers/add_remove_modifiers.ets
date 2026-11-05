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
// arktsid: add_remove_modifiers
// description: Modifiers can be both added and removed via `(?ims-ims:)`.

function main(): void {
    let re1: RegExp = new RegExp('(?m-i:^a$)', 'i');
    arktest.assertTrue(!re1.test('A\n'), 'Should not match \'A\\n\'');
    arktest.assertTrue(re1.test('a\n'), 'Should match \'a\\n\'');

    let re2: RegExp = new RegExp('(?m-i:^a$)', 'i');
    arktest.assertTrue(!re2.test('A\n'), 'Should not match \'A\\n\'');
    arktest.assertTrue(re2.test('a\n'), 'Should match \'a\\n\'');
}