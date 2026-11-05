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

// arktsid: group_11
// description: Execute /a(..(..)..)/.exec("abcdefgh") and check nested capture group results [0..2]
// Conversion notes:
//  - The pattern groups the Disjunction and saves each capture group: full match "abcdefg",
//    outer group "bcdefg", inner group "de".

function main(): void {
    let r: RegExp = new RegExp('a(..(..)..)');
    let result: RegExpExecArray | null = r.exec('abcdefgh');
    if (result != null) {
        arktest.assertEQ(result.length, 3, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, 'abcdefgh', 'input');
        arktest.assertEQ(result[0], 'abcdefg', 'group 0');
        arktest.assertEQ(result[1], 'bcdefg', 'group 1');
        arktest.assertEQ(result[2], 'de', 'group 2');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}