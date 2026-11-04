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

// arktsid: alternation_02
// description: Execute /((a)|(ab))((c)|(bc))/.exec("abc") and check results
// Conversion notes:
//  - unmatched capture groups in the exec result are undefined, so the result array is
//    ["abc", "a", "a", undefined, "bc", undefined, "bc"] with index 0 and input "abc".

function main(): void {
    let r: RegExp = new RegExp('((a)|(ab))((c)|(bc))');
    let result: RegExpExecArray | null = r.exec('abc');
    if (result != null) {
        arktest.assertEQ(result.length, 7, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, 'abc', 'input');
        arktest.assertEQ(result[0], 'abc', 'element 0');
        arktest.assertEQ(result[1], 'a', 'element 1');
        arktest.assertEQ(result[2], 'a', 'element 2');
        arktest.assertEQ(result[3], undefined, 'element 3');
        arktest.assertEQ(result[4], 'bc', 'element 4');
        arktest.assertEQ(result[5], undefined, 'element 5');
        arktest.assertEQ(result[6], 'bc', 'element 6');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}