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

// arktsid: non_unicode_references
// description: Named backreferences in non-Unicode RegExps
// Conversion notes:
//  - Named backreferences \k<name> (inside / before the group definition) resolve via PCRE2.
//  - A named group that is absent from the match is reported as undefined in the groups container.

function main(): void {
    // Named references.
    let r1: RegExpExecArray | null = new RegExp('(?<b>.).\\k<b>').exec('bab');
    arktest.assertTrue(r1 !== null, 'named ref: \'bab\' should match');
    arktest.assertEQ(r1![0], 'bab', 'named ref: full match');
    arktest.assertEQ(r1![1], 'b', 'named ref: group b');
    arktest.assertTrue(new RegExp('(?<b>.).\\k<b>').exec('baa') === null,
        'named ref: \'baa\' should not match');

    // Reference inside group.
    let r2: RegExpExecArray | null = new RegExp('(?<a>\\k<a>\\w)..').exec('bab');
    arktest.assertTrue(r2 !== null, 'ref inside group: \'bab\' should match');
    arktest.assertEQ(r2![0], 'bab', 'ref inside group: full match');
    arktest.assertEQ(r2![1], 'b', 'ref inside group: group a');
    arktest.assertEQ(r2!.groups!['a'], 'b', 'ref inside group: groups.a');

    // Reference before group.
    let r3: RegExpExecArray | null = new RegExp('\\k<a>(?<a>b)\\w\\k<a>').exec('bab');
    arktest.assertTrue(r3 !== null, 'ref before group: \'bab\' should match');
    arktest.assertEQ(r3![0], 'bab', 'ref before group: full match');
    arktest.assertEQ(r3![1], 'b', 'ref before group: group a');
    arktest.assertEQ(r3!.groups!['a'], 'b', 'ref before group: groups.a');

    let r4: RegExpExecArray | null = new RegExp('(?<b>b)\\k<a>(?<a>a)\\k<b>').exec('bab');
    arktest.assertTrue(r4 !== null, 'two groups: \'bab\' should match');
    arktest.assertEQ(r4![0], 'bab', 'two groups: full match');
    arktest.assertEQ(r4![1], 'b', 'two groups: group b');
    arktest.assertEQ(r4![2], 'a', 'two groups: group a');
    arktest.assertEQ(r4!.groups!['a'], 'a', 'two groups: groups.a');
    arktest.assertEQ(r4!.groups!['b'], 'b', 'two groups: groups.b');

    // Repeated reference-before-group matches.
    let r5: RegExpExecArray | null = new RegExp('\\k<a>(?<a>b)\\w\\k<a>').exec('bab');
    arktest.assertEQ(r5![0], 'bab', 'repeat: full match');
    arktest.assertEQ(r5![1], 'b', 'repeat: group a');
    let r6: RegExpExecArray | null = new RegExp('(?<b>b)\\k<a>(?<a>a)\\k<b>').exec('bab');
    arktest.assertEQ(r6![0], 'bab', 'repeat: full match');
    arktest.assertEQ(r6![1], 'b', 'repeat: group b');
    arktest.assertEQ(r6![2], 'a', 'repeat: group a');

    // Reference properties.
    let r7: RegExpExecArray | null = new RegExp('(?<a>a)(?<b>b)\\k<a>').exec('aba');
    arktest.assertEQ(r7!.groups!['a'], 'a', 'groups.a');
    arktest.assertEQ(r7!.groups!['b'], 'b', 'groups.b');
    arktest.assertTrue(r7!.groups!['c'] === undefined, 'groups.c is undefined');
    let r8: RegExpExecArray | null = new RegExp('(?<a>a)(?<b>b)\\k<a>|(?<c>c)').exec('aba');
    arktest.assertTrue(r8!.groups!['c'] === undefined, 'groups.c is undefined (alternative)');
}