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
// arktsid: add_ignorecase_affects_backreferences
// description: Adding ignoreCase (`i`) modifier in group affects backreferences in group.

function main(): void {
    let re1 = new RegExp('(a)(?i:\\1)', '');
    arktest.assertTrue(!re1.test('AA'));
    arktest.assertTrue(!re1.test('Aa'));
    arktest.assertTrue(re1.test('aa'));
    arktest.assertTrue(re1.test('aA'));

    let re2 = new RegExp('(a)(?i-:\\1)', '');
    arktest.assertTrue(!re2.test('AA'));
    arktest.assertTrue(!re2.test('Aa'));
    arktest.assertTrue(re2.test('aa'));
    arktest.assertTrue(re2.test('aA'));
}