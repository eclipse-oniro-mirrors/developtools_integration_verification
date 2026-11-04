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

// arktsid: unicode_references
// description: Named backreferences in Unicode RegExps
// Conversion notes:
//  - Named backreferences \k<name> (inside / before the group definition) resolve via PCRE2 in Unicode mode.
//  - A named group absent from the match is reported as undefined in the groups container.

function assertMatchArray(actual: (String | undefined)[] | null,
    expected: (String | undefined)[], comment: string): void {
    if (actual == null) {
        arktest.assertTrue(false, comment + ' (match returned null)');
        return;
    }
    arktest.assertEQ(actual.length, expected.length, comment + ' (length)');
    for (let i = 0; i < expected.length; i++) {
        arktest.assertEQ(actual[i], expected[i], comment + ' (index ' + i + ')');
    }
}

function main(): void {
    // Named references.
    assertMatchArray('bab'.match(new RegExp('(?<b>.).\\k<b>', 'u')), ['bab', 'b'], 'named ref');
    arktest.assertTrue('baa'.match(new RegExp('(?<b>.).\\k<b>', 'u')) === null,
        'named ref: \'baa\' should not match');

    // Reference inside group.
    assertMatchArray('bab'.match(new RegExp('(?<a>\\k<a>\\w)..', 'u')), ['bab', 'b'], 'ref inside group');
        arktest.assertEQ('bab'.match(new RegExp('(?<a>\\k<a>\\w)..', 'u'))!.groups!['a'], 'b',
        'ref inside group: groups.a');

    // Reference before group.
    assertMatchArray('bab'.match(new RegExp('\\k<a>(?<a>b)\\w\\k<a>', 'u')), ['bab', 'b'], 'ref before group');
        arktest.assertEQ('bab'.match(new RegExp('\\k<a>(?<a>b)\\w\\k<a>', 'u'))!.groups!['a'], 'b',
        'ref before group: groups.a');
    let m: RegExpMatchArray | null = 'bab'.match(new RegExp('(?<b>b)\\k<a>(?<a>a)\\k<b>', 'u'));
    assertMatchArray(m, ['bab', 'b', 'a'], 'two groups');
    let a = m!.groups!['a'];
    let b = m!.groups!['b'];
    arktest.assertEQ(a, 'a', 'destructured a');
    arktest.assertEQ(b, 'b', 'destructured b');

    // Repeated reference-before-group matches (no flag).
    assertMatchArray('bab'.match(new RegExp('\\k<a>(?<a>b)\\w\\k<a>')), ['bab', 'b'], 'repeat no-flag');
    assertMatchArray('bab'.match(new RegExp('(?<b>b)\\k<a>(?<a>a)\\k<b>')), ['bab', 'b', 'a'], 'two groups no-flag');

    // Reference properties.
    let r7: RegExpExecArray | null = new RegExp('(?<a>a)(?<b>b)\\k<a>', 'u').exec('aba');
    arktest.assertEQ(r7!.groups!['a'], 'a', 'groups.a');
    arktest.assertEQ(r7!.groups!['b'], 'b', 'groups.b');
    arktest.assertTrue(r7!.groups!['c'] === undefined, 'groups.c is undefined');
    let r8: RegExpExecArray | null = new RegExp('(?<a>a)(?<b>b)\\k<a>|(?<c>c)', 'u').exec('aba');
    arktest.assertTrue(r8!.groups!['c'] === undefined, 'groups.c is undefined (alternative)');
}