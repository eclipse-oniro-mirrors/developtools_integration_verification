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
// arktsid: remove_ignorecase_affects_characterescapes
// description: Removing ignoreCase (`i`) modifier in group affects character escapes in group.

function main(): void {
    let re1: RegExp = new RegExp('(?-i:\\x61)b', 'i');
    arktest.assertTrue(re1.test('ab'));
    arktest.assertTrue(re1.test('aB'));
    arktest.assertTrue(!re1.test('Ab'));

    let re2: RegExp = new RegExp('(?-i:\\u0061)b', 'i');
    arktest.assertTrue(re2.test('ab'));
    arktest.assertTrue(re2.test('aB'));
    arktest.assertTrue(!re2.test('Ab'));

    let re3: RegExp = new RegExp('(?-i:\\u{0061})b', 'iu');
    arktest.assertTrue(re3.test('ab'));
    arktest.assertTrue(re3.test('aB'));
    arktest.assertTrue(!re3.test('Ab'));
}