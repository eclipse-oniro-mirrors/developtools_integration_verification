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
// arktsid: nesting_remove_ignorecase_within_add_ignorecase
// description: Can remove ignoreCase (`i`) modifier for group nested within a group that adds ignoreCase modifier.

function main(): void {
    let re1 = new RegExp('(?i:a(?-i:b))c');
    arktest.assertTrue(!re1.test('ABC'));
    arktest.assertTrue(!re1.test('ABc'));
    arktest.assertTrue(re1.test('Abc'));
    arktest.assertTrue(!re1.test('aBc'));
    arktest.assertTrue(!re1.test('abC'));
    arktest.assertTrue(re1.test('abc'));
}