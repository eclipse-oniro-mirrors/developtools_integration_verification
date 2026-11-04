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

// arktsid: group_12
// description: Execute /(a(b(c)))(d(e(f)))/.exec("xabcdefg") and check results
// Conversion notes:
//  - capture groups are numbered by order of opening parenthesis:
//    1="abc", 2="bc", 3="c", 4="def", 5="ef", 6="f".

function main(): void {
    let r: RegExp = new RegExp('(a(b(c)))(d(e(f)))');
    let result: RegExpExecArray | null = r.exec('xabcdefg');
    if (result != null) {
        arktest.assertEQ(result.length, 7, 'length');
        arktest.assertEQ(result.index, 1, 'index');
        arktest.assertEQ(result.input, 'xabcdefg', 'input');
        arktest.assertEQ(result[0], 'abcdef', 'element 0');
        arktest.assertEQ(result[1], 'abc', 'element 1');
        arktest.assertEQ(result[2], 'bc', 'element 2');
        arktest.assertEQ(result[3], 'c', 'element 3');
        arktest.assertEQ(result[4], 'def', 'element 4');
        arktest.assertEQ(result[5], 'ef', 'element 5');
        arktest.assertEQ(result[6], 'f', 'element 6');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}