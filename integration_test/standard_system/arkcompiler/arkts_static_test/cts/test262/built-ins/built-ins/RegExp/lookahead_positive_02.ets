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

// arktsid: lookahead_positive_02
// description: Execute /(?=(a+))a*b\1/.exec("baaabac") and check results
// Conversion notes:
//  - positive lookahead (?=(a+)) captures the maximal run of "a" without advancing; a*b then matches "ab",
//    and \1 backreference requires the captured "a" to follow, yielding match "aba" at index 3.

function main(): void {
    let r: RegExp = new RegExp('(?=(a+))a*b\\1');
    let m: RegExpExecArray | null = r.exec('baaabac');
    if (m != null) {
        arktest.assertEQ(m.length, 2, 'length');
        arktest.assertEQ(m.index, 3, 'index');
        arktest.assertEQ(m.input, 'baaabac', 'input');
        arktest.assertEQ(m[0], 'aba', 'match');
        arktest.assertEQ(m[1], 'a', 'capture group 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}