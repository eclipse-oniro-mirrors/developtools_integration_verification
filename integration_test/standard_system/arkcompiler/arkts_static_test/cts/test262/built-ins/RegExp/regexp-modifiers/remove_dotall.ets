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
// arktsid: remove_dotall
// description: dotAll (`s`) modifier can be added via `(?s:)` or `(?s-:)`.

function main(): void {
    let re1: RegExp = new RegExp('(?-s:^.$)', 's');
    arktest.assertTrue(re1.test('a'));
    arktest.assertTrue(re1.test('3'));
    arktest.assertTrue(re1.test('π'));
    arktest.assertTrue(re1.test('‧'));
    arktest.assertTrue(re1.test('\u0085'));
    arktest.assertTrue(re1.test('\v'));
    arktest.assertTrue(re1.test('\f'));
    arktest.assertTrue(re1.test('᠎'));
    arktest.assertTrue(!re1.test('\u{10300}'));
    arktest.assertTrue(!re1.test('\n'));
    arktest.assertTrue(!re1.test('\r'));
    arktest.assertTrue(!re1.test('\u2028'));
    arktest.assertTrue(!re1.test('\u2029'));
    arktest.assertTrue(re1.test('\uD800'));
    arktest.assertTrue(re1.test('\uDFFF'));

    let re2: RegExp = new RegExp('(?-s:^.$)', 's');
    arktest.assertTrue(re2.test('a'));
    arktest.assertTrue(re2.test('3'));
    arktest.assertTrue(re2.test('π'));
    arktest.assertTrue(re2.test('‧'));
    arktest.assertTrue(re2.test('\u0085'));
    arktest.assertTrue(re2.test('\v'));
    arktest.assertTrue(re2.test('\f'));
    arktest.assertTrue(re2.test('᠎'));
    arktest.assertTrue(!re2.test('\u{10300}'));
    arktest.assertTrue(!re2.test('\n'));
    arktest.assertTrue(!re2.test('\r'));
    arktest.assertTrue(!re2.test('\u2028'));
    arktest.assertTrue(!re2.test('\u2029'));
    arktest.assertTrue(re2.test('\uD800'));
    arktest.assertTrue(re2.test('\uDFFF'));

    let re3: RegExp = new RegExp('a.(?-s:b.b).c', 's');
    arktest.assertTrue(re3.test('a,b,b,c'));
    arktest.assertTrue(re3.test('a\nb,b\nc'));
    arktest.assertTrue(!re3.test('a,b\nb,c'));
    arktest.assertTrue(!re3.test('a\nb\nb\nc'));

    let re4: RegExp = new RegExp('a.(?-s:b.b).c', 's');
    arktest.assertTrue(re4.test('a,b,b,c'));
    arktest.assertTrue(re4.test('a\nb,b\nc'));
    arktest.assertTrue(!re4.test('a,b\nb,c'));
    arktest.assertTrue(!re4.test('a\nb\nb\nc'));
}