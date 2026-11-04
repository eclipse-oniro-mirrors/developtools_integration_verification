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
// arktsid: add_ignorecase
// description: ignoreCase (`i`) modifier can be added via `(?i:)` or `(?i-:)`.

function main(): void {
    let re1 = new RegExp('(?i:a)b', '');
    arktest.assertTrue(!re1.test('AB'));
    arktest.assertTrue(re1.test('Ab'));
    arktest.assertTrue(re1.test('ab'));

    let re2 = new RegExp('(?i:a)b');
    arktest.assertTrue(!re2.test('AB'));
    arktest.assertTrue(re2.test('Ab'));
    arktest.assertTrue(re2.test('ab'));

    let re3 = new RegExp('b(?i:a)', '');
    arktest.assertTrue(!re3.test('BA'));
    arktest.assertTrue(re3.test('bA'));
    arktest.assertTrue(re3.test('ba'));

    let re4 = new RegExp('b(?i:a)');
    arktest.assertTrue(!re4.test('BA'));
    arktest.assertTrue(re4.test('bA'));
    arktest.assertTrue(re4.test('ba'));

    let re5 = new RegExp('a(?i:b)c', '');
    arktest.assertTrue(re5.test('abc'));
    arktest.assertTrue(re5.test('aBc'));
    arktest.assertTrue(!re5.test('ABc'));
    arktest.assertTrue(!re5.test('aBC'));
    arktest.assertTrue(!re5.test('ABC'));

    let re6 = new RegExp('a(?i:b)c');
    arktest.assertTrue(re6.test('abc'));
    arktest.assertTrue(re6.test('aBc'));
    arktest.assertTrue(!re6.test('ABc'));
    arktest.assertTrue(!re6.test('aBC'));
    arktest.assertTrue(!re6.test('ABC'));
}