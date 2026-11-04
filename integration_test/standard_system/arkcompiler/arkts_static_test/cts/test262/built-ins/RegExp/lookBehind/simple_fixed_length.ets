/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: simple_fixed_length
// description: Simple fixed-length matches

function assertNoMatch(pattern: String, str: String, label: String): void {
    let m: RegExpExecArray | null = new RegExp(pattern).exec(str);
    arktest.assertTrue(m == null, label);
}

function assertSingleMatch(pattern: String, str: String, expected: String, label: String): void {
    let m: RegExpExecArray | null = new RegExp(pattern).exec(str);
    if (m == null) {
        arktest.assertTrue(false, label + ': expected a match');
        return;
    }
    arktest.assertEQ(m.length, 1, label + ' (length)');
    arktest.assertEQ(m[0], expected, label + ' (element 0)');
}

function main(): void {
    assertNoMatch('^.(?<=a)', 'b', '#1');
    assertNoMatch('^f\\w\\w(?<=\\woo)', 'boo', '#2');
    assertNoMatch('^f\\w\\w(?<=\\woo)', 'fao', '#3');
    assertNoMatch('^f\\w\\w(?<=\\woo)', 'foa', '#4');

    assertSingleMatch('^.(?<=a)', 'a', 'a', '#5');
    assertSingleMatch('^f..(?<=.oo)', 'foo1', 'foo', '#6');
    assertSingleMatch('^f\\w\\w(?<=\\woo)', 'foo2', 'foo', '#7');
    assertSingleMatch('(?<=abc)\\w\\w\\w', 'abcdef', 'def', '#8');
    assertSingleMatch('(?<=a.c)\\w\\w\\w', 'abcdef', 'def', '#9');
    assertSingleMatch('(?<=a\\wc)\\w\\w\\w', 'abcdef', 'def', '#10');
    assertSingleMatch('(?<=a[a-z])\\w\\w\\w', 'abcdef', 'cde', '#11');
    assertSingleMatch('(?<=a[a-z][a-z])\\w\\w\\w', 'abcdef', 'def', '#12');
    assertSingleMatch('(?<=a[a-z]{2})\\w\\w\\w', 'abcdef', 'def', '#13');
    assertSingleMatch('(?<=a{1})\\w\\w\\w', 'abcdef', 'bcd', '#14');
    assertSingleMatch('(?<=a{1}b{1})\\w\\w\\w', 'abcdef', 'cde', '#15');
    assertSingleMatch('(?<=a{1}[a-z]{2})\\w\\w\\w', 'abcdef', 'def', '#16');
}