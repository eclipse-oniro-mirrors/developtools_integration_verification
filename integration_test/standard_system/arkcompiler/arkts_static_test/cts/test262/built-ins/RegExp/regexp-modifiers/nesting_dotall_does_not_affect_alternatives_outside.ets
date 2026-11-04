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
// arktsid: nesting_dotall_does_not_affect_alternatives_outside
// description: Nesting dotAll (`s`) modifier should not affect alternatives outside.

function main(): void {
    let re1 = new RegExp('a.a|(?-s:b.b|(?s:c.c)|d.d|(?-s:e.e)|f.f)|g.g|(?s:h.h)|k.k', 's');
    arktest.assertTrue(re1.test('a\na'));
    arktest.assertTrue(!re1.test('b\nb'));
    arktest.assertTrue(re1.test('c\nc'));
    arktest.assertTrue(!re1.test('d\nd'));
    arktest.assertTrue(!re1.test('e\ne'));
    arktest.assertTrue(!re1.test('f\nf'));
    arktest.assertTrue(re1.test('g\ng'));
    arktest.assertTrue(re1.test('h\nh'));
    arktest.assertTrue(re1.test('k\nk'));
    let re2 = new RegExp('a.a|(?s:b.b|(?-s:c.c)|d.d|(?s:e.e)|f.f)|g.g|(?-s:h.h)|k.k');
    arktest.assertTrue(!re2.test('a\na'));
    arktest.assertTrue(re2.test('b\nb'));
    arktest.assertTrue(!re2.test('c\nc'));
    arktest.assertTrue(re2.test('d\nd'));
    arktest.assertTrue(re2.test('e\ne'));
    arktest.assertTrue(re2.test('f\nf'));
    arktest.assertTrue(!re2.test('g\ng'));
    arktest.assertTrue(!re2.test('h\nh'));
    arktest.assertTrue(!re2.test('k\nk'));
}