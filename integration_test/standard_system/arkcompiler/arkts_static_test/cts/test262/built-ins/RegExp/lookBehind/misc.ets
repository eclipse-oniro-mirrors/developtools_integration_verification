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

// arktsid: regexp_lookbehind_misc
// description: Misc RegExp lookbehind tests
// Conversion notes:
//  - \1 inside its own capture group is a forward backreference; it is unset
//    when evaluated, so it matches empty and the trailing ሴ is not consumed.
//  - ArkTS RegExp only accepts fixed-length lookbehind; variable-length
//    lookbehind (?<=fo+) / (?<=fo*) throws SyntaxError at runtime.

function checkNull(res: (String | undefined)[] | null, label: String): void {
    arktest.assertTrue(res == null, label);
}

function checkArray(res: (String | undefined)[] | null, expected: String[], label: String): void {
    if (res == null) {
        arktest.assertTrue(false, label + ': expected match, got null');
        return;
    }
    arktest.assertEQ(res.length, expected.length, label + ' (length)');
    for (let i = 0; i < expected.length; i++) {
        arktest.assertEQ(res[i], expected[i], label + ' (index ' + i + ')');
    }
}

function main(): void {
    checkNull(new RegExp('(?<=$abc)def').match('abcdef'), '#1');
    checkNull(new RegExp('^f.o(?<=foo)$').match('fno'), '#2');
    checkNull(new RegExp('^foo(?<!foo)$').match('foo'), '#3');
    checkNull(new RegExp('^f.o(?<!foo)$').match('foo'), '#4');

    checkArray(new RegExp('^foo(?<=foo)$').match('foo'), ['foo'], '#5');
    checkArray(new RegExp('^f.o(?<=foo)$').match('foo'), ['foo'], '#6');
    checkArray(new RegExp('^f.o(?<!foo)$').match('fno'), ['fno'], '#7');

    checkArray(new RegExp('(abc\\1)').exec('abc'), ['abc', 'abc'], '#10');
    checkArray(new RegExp('(abc\\1)').exec('abcሴ'), ['abc', 'abc'], '#11');
    checkArray(new RegExp('(abc\\1)', 'i').exec('abc'), ['abc', 'abc'], '#12');
    checkArray(new RegExp('(abc\\1)', 'i').exec('abcሴ'), ['abc', 'abc'], '#13');
}