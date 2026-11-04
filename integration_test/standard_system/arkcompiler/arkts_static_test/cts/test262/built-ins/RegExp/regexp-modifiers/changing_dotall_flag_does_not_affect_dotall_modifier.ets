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
// arktsid: changing_dotall_flag_does_not_affect_dotall_modifier
// description: New dotAll (`s`) flag from RegExp constructor does not affect dotAll modifier in group.

function main(): void {
    let re1: RegExp = new RegExp('(?s:^.$)');
        arktest.assertTrue(re1.test('a'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re1.test('3'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re1.test('π'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re1.test('‧'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
    arktest.assertTrue(re1.test('\u0085'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re1.test('\v'),
        'Pattern character \'.\' still should match mon-line terminators in modified group');
        arktest.assertTrue(re1.test('\f'),
        'Pattern character \'.\' still should match mon-line terminators in modified group');
        arktest.assertTrue(re1.test('᠎'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
    arktest.assertTrue(!re1.test('\u{10300}'), 'Supplementary plane still not matched by a single .');
    arktest.assertTrue(re1.test('\n'), 'Pattern character \'.\' still should match line terminators in modified group');
    arktest.assertTrue(re1.test('\r'), 'Pattern character \'.\' still should match line terminators in modified group');
    arktest.assertTrue(re1.test('\u2028'),
        'Pattern character \'.\' still should match line terminators in modified group');
    arktest.assertTrue(re1.test('\u2029'),
        'Pattern character \'.\' still should match line terminators in modified group');
        arktest.assertTrue(re1.test('\uD800'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re1.test('\uDFFF'),
        'Pattern character \'.\' still should match non-line terminators in modified group');

    let re2: RegExp = new RegExp('(?-s:^.$)', 's');
        arktest.assertTrue(re2.test('a'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re2.test('3'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re2.test('π'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re2.test('‧'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
    arktest.assertTrue(re2.test('\u0085'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re2.test('\v'),
        'Pattern character \'.\' still should match mon-line terminators in modified group');
        arktest.assertTrue(re2.test('\f'),
        'Pattern character \'.\' still should match mon-line terminators in modified group');
        arktest.assertTrue(re2.test('᠎'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
    arktest.assertTrue(!re2.test('\u{10300}'), 'Supplementary plane still not matched by a single .');
    arktest.assertTrue(!re2.test('\n'), 'Pattern character \'.\' still should not match \'\\n\' in modified group');
    arktest.assertTrue(!re2.test('\r'), 'Pattern character \'.\' still should not match \'\\r\' in modified group');
    arktest.assertTrue(!re2.test('\u2028'),
        'Pattern character \'.\' still should not match \'\\u2028\' in modified group');
    arktest.assertTrue(!re2.test('\u2029'),
        'Pattern character \'.\' still should not match \'\\u2029\' in modified group');
        arktest.assertTrue(re2.test('\uD800'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
        arktest.assertTrue(re2.test('\uDFFF'),
        'Pattern character \'.\' still should match non-line terminators in modified group');
}