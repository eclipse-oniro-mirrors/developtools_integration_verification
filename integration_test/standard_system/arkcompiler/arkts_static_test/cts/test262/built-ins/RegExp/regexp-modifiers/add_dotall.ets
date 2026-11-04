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
// arktsid: add_dotall
// description: dotAll (`s`) modifier can be added via `(?s:)` or `(?s-:)`.

function main(): void {
    let re1 = new RegExp('(?s:^.$)', '');
    arktest.assertTrue(re1.test('a'));
    arktest.assertTrue(re1.test('3'));
    arktest.assertTrue(re1.test('π'));
    arktest.assertTrue(re1.test('‧'));
    arktest.assertTrue(re1.test('\u0085'));
    arktest.assertTrue(re1.test('\v'));
    arktest.assertTrue(re1.test('\f'));
    arktest.assertTrue(re1.test('᠎'));
    arktest.assertTrue(!re1.test('\u{10300}'));
    arktest.assertTrue(re1.test('\n'));
    arktest.assertTrue(re1.test('\r'));
    arktest.assertTrue(re1.test('\u2028'));
    arktest.assertTrue(re1.test('\u2029'));
    arktest.assertTrue(re1.test('\uD800'));
    arktest.assertTrue(re1.test('\uDFFF'));

    let re2 = new RegExp('(?s:^.$)', '');
    arktest.assertTrue(re2.test('a'));
    arktest.assertTrue(re2.test('3'));
    arktest.assertTrue(re2.test('π'));
    arktest.assertTrue(re2.test('‧'));
    arktest.assertTrue(re2.test('\u0085'));
    arktest.assertTrue(re2.test('\v'));
    arktest.assertTrue(re2.test('\f'));
    arktest.assertTrue(re2.test('᠎'));
    arktest.assertTrue(!re2.test('\u{10300}'));
    arktest.assertTrue(re2.test('\n'));
    arktest.assertTrue(re2.test('\r'));
    arktest.assertTrue(re2.test('\u2028'));
    arktest.assertTrue(re2.test('\u2029'));
    arktest.assertTrue(re2.test('\uD800'));
    arktest.assertTrue(re2.test('\uDFFF'));

    let re3 = new RegExp('(?s-:^.$)', '');
    arktest.assertTrue(re3.test('a'));
    arktest.assertTrue(re3.test('3'));
    arktest.assertTrue(re3.test('π'));
    arktest.assertTrue(re3.test('‧'));
    arktest.assertTrue(re3.test('\u0085'));
    arktest.assertTrue(re3.test('\v'));
    arktest.assertTrue(re3.test('\f'));
    arktest.assertTrue(re3.test('᠎'));
    arktest.assertTrue(!re3.test('\u{10300}'));
    arktest.assertTrue(re3.test('\n'));
    arktest.assertTrue(re3.test('\r'));
    arktest.assertTrue(re3.test('\u2028'));
    arktest.assertTrue(re3.test('\u2029'));
    arktest.assertTrue(re3.test('\uD800'));
    arktest.assertTrue(re3.test('\uDFFF'));

    let re4 = new RegExp('(?s-:^.$)', '');
    arktest.assertTrue(re4.test('a'));
    arktest.assertTrue(re4.test('3'));
    arktest.assertTrue(re4.test('π'));
    arktest.assertTrue(re4.test('‧'));
    arktest.assertTrue(re4.test('\u0085'));
    arktest.assertTrue(re4.test('\v'));
    arktest.assertTrue(re4.test('\f'));
    arktest.assertTrue(re4.test('᠎'));
    arktest.assertTrue(!re4.test('\u{10300}'));
    arktest.assertTrue(re4.test('\n'));
    arktest.assertTrue(re4.test('\r'));
    arktest.assertTrue(re4.test('\u2028'));
    arktest.assertTrue(re4.test('\u2029'));
    arktest.assertTrue(re4.test('\uD800'));
    arktest.assertTrue(re4.test('\uDFFF'));

    let re5 = new RegExp('a.(?s:b.b).c', '');
    arktest.assertTrue(re5.test('a,b,b,c'));
    arktest.assertTrue(re5.test('a,b\nb,c'));
    arktest.assertTrue(!re5.test('a\nb\nb,c'));
    arktest.assertTrue(!re5.test('a,b\nb\nc'));
    arktest.assertTrue(!re5.test('a\nb\nb\nc'));

    let re6 = new RegExp('a.(?s:b.b).c', '');
    arktest.assertTrue(re6.test('a,b,b,c'));
    arktest.assertTrue(re6.test('a,b\nb,c'));
    arktest.assertTrue(!re6.test('a\nb\nb,c'));
    arktest.assertTrue(!re6.test('a,b\nb\nc'));
    arktest.assertTrue(!re6.test('a\nb\nb\nc'));
}