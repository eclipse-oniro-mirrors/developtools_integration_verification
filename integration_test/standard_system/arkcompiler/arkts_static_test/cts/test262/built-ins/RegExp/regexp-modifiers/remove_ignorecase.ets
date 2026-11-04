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
// arktsid: remove_ignorecase
// description: ignoreCase (`i`) modifier can be removed via `(?i:)` or `(?i-:)`.

function main(): void {
    let re1 = new RegExp('(?-i:fo)o', 'i');
    arktest.assertTrue(!re1.test('FOO'));
    arktest.assertTrue(!re1.test('FOo'));
    arktest.assertTrue(re1.test('foo'));
    arktest.assertTrue(re1.test('foO'));

    let re2 = new RegExp('(?-i:fo)o', 'i');
    arktest.assertTrue(!re2.test('FOO'));
    arktest.assertTrue(!re2.test('FOo'));
    arktest.assertTrue(re2.test('foo'));
    arktest.assertTrue(re2.test('foO'));

    let re3 = new RegExp('b(?-i:ar)', 'i');
    arktest.assertTrue(!re3.test('BAR'));
    arktest.assertTrue(!re3.test('bAR'));
    arktest.assertTrue(re3.test('bar'));
    arktest.assertTrue(re3.test('Bar'));

    let re4 = new RegExp('b(?-i:ar)', 'i');
    arktest.assertTrue(!re4.test('BAR'));
    arktest.assertTrue(!re4.test('bAR'));
    arktest.assertTrue(re4.test('bar'));
    arktest.assertTrue(re4.test('Bar'));

    let re5 = new RegExp('b(?-i:a)z', 'i');
    arktest.assertTrue(re5.test('baz'));
    arktest.assertTrue(!re5.test('bAz'));
    arktest.assertTrue(re5.test('Baz'));
    arktest.assertTrue(re5.test('baZ'));
    arktest.assertTrue(re5.test('BaZ'));
    arktest.assertTrue(!re5.test('BAZ'));

    let re6 = new RegExp('b(?-i:a)z', 'i');
    arktest.assertTrue(re6.test('baz'));
    arktest.assertTrue(!re6.test('bAz'));
    arktest.assertTrue(re6.test('Baz'));
    arktest.assertTrue(re6.test('baZ'));
    arktest.assertTrue(re6.test('BaZ'));
    arktest.assertTrue(!re6.test('BAZ'));
}