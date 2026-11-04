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

// arktsid: unicode_identity_escape
// description: IdentityEscape for Unicode RegExp
// Conversion notes: Unicode 模式下 IdentityEscape 仅限语法字符(SyntaxCharacter)与 SOLIDUS(/)，用 "u" 标志验证 \^ \$ \. \* \+ \? \(
// \) \[
// Conversion notes: Unicode 模式下 IdentityEscape 仅限语法字符(SyntaxCharacter)与 SOLIDUS(/)，用 "u" 标志验证 \^ \$ \. \* \+ \? \(
// \) \[
// \] \{ \} \| \/ 在 AtomEscape 与 ClassEscape 中的身份转义。

function main(): void {
    // IdentityEscape in AtomEscape
    arktest.assertTrue(new RegExp('\\^', 'u').test('^'), 'IdentityEscape in AtomEscape: \\^');
    arktest.assertTrue(new RegExp('\\$', 'u').test('$'), 'IdentityEscape in AtomEscape: \\$');
    arktest.assertTrue(new RegExp('\\\\', 'u').test('\\'), 'IdentityEscape in AtomEscape: \\\\');
    arktest.assertTrue(new RegExp('\\.', 'u').test('.'), 'IdentityEscape in AtomEscape: \\.');
    arktest.assertTrue(new RegExp('\\*', 'u').test('*'), 'IdentityEscape in AtomEscape: \\*');
    arktest.assertTrue(new RegExp('\\+', 'u').test('+'), 'IdentityEscape in AtomEscape: \\+');
    arktest.assertTrue(new RegExp('\\?', 'u').test('?'), 'IdentityEscape in AtomEscape: \\?');
    arktest.assertTrue(new RegExp('\\(', 'u').test('('), 'IdentityEscape in AtomEscape: \\(');
    arktest.assertTrue(new RegExp('\\)', 'u').test(')'), 'IdentityEscape in AtomEscape: \\)');
    arktest.assertTrue(new RegExp('\\[', 'u').test('['), 'IdentityEscape in AtomEscape: \\[');
    arktest.assertTrue(new RegExp('\\]', 'u').test(']'), 'IdentityEscape in AtomEscape: \\]');
    arktest.assertTrue(new RegExp('\\{', 'u').test('{'), 'IdentityEscape in AtomEscape: \\{');
    arktest.assertTrue(new RegExp('\\}', 'u').test('}'), 'IdentityEscape in AtomEscape: \\}');
    arktest.assertTrue(new RegExp('\\|', 'u').test('|'), 'IdentityEscape in AtomEscape: \\|');
    arktest.assertTrue(new RegExp('\\/', 'u').test('/'), 'IdentityEscape in AtomEscape: \\/');

    // IdentityEscape in ClassEscape
    arktest.assertTrue(new RegExp('[\\^]', 'u').test('^'), 'IdentityEscape in ClassEscape: [\\^]');
    arktest.assertTrue(new RegExp('[\\$]', 'u').test('$'), 'IdentityEscape in ClassEscape: [\\$]');
    arktest.assertTrue(new RegExp('[\\\\]', 'u').test('\\'), 'IdentityEscape in ClassEscape: [\\\\]');
    arktest.assertTrue(new RegExp('[\\.]', 'u').test('.'), 'IdentityEscape in ClassEscape: [\\.]');
    arktest.assertTrue(new RegExp('[\\*]', 'u').test('*'), 'IdentityEscape in ClassEscape: [\\*]');
    arktest.assertTrue(new RegExp('[\\+]', 'u').test('+'), 'IdentityEscape in ClassEscape: [\\+]');
    arktest.assertTrue(new RegExp('[\\?]', 'u').test('?'), 'IdentityEscape in ClassEscape: [\\?]');
    arktest.assertTrue(new RegExp('[\\(]', 'u').test('('), 'IdentityEscape in ClassEscape: [\\(]');
    arktest.assertTrue(new RegExp('[\\)]', 'u').test(')'), 'IdentityEscape in ClassEscape: [\\)]');
    arktest.assertTrue(new RegExp('[\\[]', 'u').test('['), 'IdentityEscape in ClassEscape: [\\[]');
    arktest.assertTrue(new RegExp('[\\]]', 'u').test(']'), 'IdentityEscape in ClassEscape: [\\]]');
    arktest.assertTrue(new RegExp('[\\{]', 'u').test('{'), 'IdentityEscape in ClassEscape: [\\{]');
    arktest.assertTrue(new RegExp('[\\}]', 'u').test('}'), 'IdentityEscape in ClassEscape: [\\}]');
    arktest.assertTrue(new RegExp('[\\|]', 'u').test('|'), 'IdentityEscape in ClassEscape: [\\|]');
    arktest.assertTrue(new RegExp('[\\/]', 'u').test('/'), 'IdentityEscape in ClassEscape: [\\/]');
}