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
// arktsid: nesting_ignorecase_does_not_affect_alternatives_outside
// description: Nesting ignoreCase (`i`) modifier should not affect alternatives outside.

function main(): void {
    let re1 = new RegExp('a|(?-i:b|(?i:c)|d|(?-i:e)|f)|g|(?i:h)|k', 'i');
    arktest.assertTrue(re1.test('A'));
    arktest.assertTrue(!re1.test('B'));
    arktest.assertTrue(re1.test('C'));
    arktest.assertTrue(!re1.test('D'));
    arktest.assertTrue(!re1.test('E'));
    arktest.assertTrue(!re1.test('F'));
    arktest.assertTrue(re1.test('G'));
    arktest.assertTrue(re1.test('H'));
    arktest.assertTrue(re1.test('K'));
    let re2 = new RegExp('a|(?i:b|(?-i:c)|d|(?i:e)|f)|g|(?-i:h)|k');
    arktest.assertTrue(!re2.test('A'));
    arktest.assertTrue(re2.test('B'));
    arktest.assertTrue(!re2.test('C'));
    arktest.assertTrue(re2.test('D'));
    arktest.assertTrue(re2.test('E'));
    arktest.assertTrue(re2.test('F'));
    arktest.assertTrue(!re2.test('G'));
    arktest.assertTrue(!re2.test('H'));
    arktest.assertTrue(!re2.test('K'));
}