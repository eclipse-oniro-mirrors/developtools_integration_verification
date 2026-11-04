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
// arktsid: add_ignorecase_affects_characterescapes
// description: Adding ignoreCase (`i`) modifier in group affects character escapes in group.

function main(): void {
    let re1 = new RegExp('(?i:\\x61)b', '');
    arktest.assertTrue(re1.test('ab'));
    arktest.assertTrue(re1.test('Ab'));

    let re2 = new RegExp('(?i:\\u0061)b', '');
    arktest.assertTrue(re2.test('ab'));
    arktest.assertTrue(re2.test('Ab'));

    let re3 = new RegExp('(?i:\\u{0061})b', 'u');
    arktest.assertTrue(re3.test('ab'));
    arktest.assertTrue(re3.test('Ab'));

    let re4 = new RegExp('(?i-:\\x61)b', '');
    arktest.assertTrue(re4.test('ab'));
    arktest.assertTrue(re4.test('Ab'));

    let re5 = new RegExp('(?i-:\\u0061)b', '');
    arktest.assertTrue(re5.test('ab'));
    arktest.assertTrue(re5.test('Ab'));

    let re6 = new RegExp('(?i-:\\u{0061})b', 'u');
    arktest.assertTrue(re6.test('ab'));
    arktest.assertTrue(re6.test('Ab'));
}