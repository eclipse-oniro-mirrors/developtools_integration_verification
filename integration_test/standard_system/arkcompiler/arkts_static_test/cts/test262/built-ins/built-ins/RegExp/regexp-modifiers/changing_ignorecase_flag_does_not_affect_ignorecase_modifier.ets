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
// arktsid: changing_ignorecase_flag_does_not_affect_ignorecase_modifier
// description: New ignoreCase (`i`) flag from RegExp constructor does not affect ignoreCase modifier in group.

function main(): void {
    let re1: RegExp = new RegExp('(?i:aB)');
    arktest.assertTrue(re1.test('AB'), 'still should ignore case in modified group');
    arktest.assertTrue(re1.test('Ab'), 'still should ignore case in modified group');
    arktest.assertTrue(re1.test('aB'), 'still should ignore case in modified group');
    arktest.assertTrue(re1.test('ab'), 'still should ignore case in modified group');

    let re2: RegExp = new RegExp('(?-i:aB)', 'i');
    arktest.assertTrue(!re2.test('AB'), 'still should preserve case in modified group');
    arktest.assertTrue(!re2.test('Ab'), 'still should preserve case in modified group');
    arktest.assertTrue(!re2.test('ab'), 'still should preserve case in modified group');
    arktest.assertTrue(re2.test('aB'), 'still should preserve case in modified group');
}