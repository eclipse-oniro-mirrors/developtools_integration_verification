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

// arktsid: group_13
// description: Execute /(a(b(c)))(d(e(f)))\2\5/.exec("xabcdefbcefg") and check results
// Conversion notes:
//  - nested capturing groups combined with backreferences \2 and \5: the regex literal is
//    rewritten as new RegExp("(a(b(c)))(d(e(f)))\\2\\5"). Group 2 captures "bc" and group 5
//    captures "ef", so the overall match is "abc" + "def" + "bc" + "ef" = "abcdefbcef".

function main(): void {
    let r: RegExp = new RegExp('(a(b(c)))(d(e(f)))\\2\\5');
    let m: RegExpExecArray | null = r.exec('xabcdefbcefg');
    if (m != null) {
        arktest.assertEQ(m.length, 7, 'length');
        arktest.assertEQ(m.index, 1, 'index');
        arktest.assertEQ(m.input, 'xabcdefbcefg', 'input');
        arktest.assertEQ(m[0], 'abcdefbcef', 'm[0]');
        arktest.assertEQ(m[1], 'abc', 'm[1]');
        arktest.assertEQ(m[2], 'bc', 'm[2]');
        arktest.assertEQ(m[3], 'c', 'm[3]');
        arktest.assertEQ(m[4], 'def', 'm[4]');
        arktest.assertEQ(m[5], 'ef', 'm[5]');
        arktest.assertEQ(m[6], 'f', 'm[6]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}