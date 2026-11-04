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

// arktsid: quantifier_repeat_03
// description: Execute /(aa|aabaac|ba|b|c)*/.exec("aabaac") and check results
// Conversion notes:
//  - The greedy * quantifier backtracks: full match is "aaba" with the last capture group "ba",
//    so the exec result is ["aaba", "ba"] with index 0 and input "aabaac".

function main(): void {
    let r: RegExp = new RegExp('(aa|aabaac|ba|b|c)*');
    let result: RegExpExecArray | null = r.exec('aabaac');
    if (result != null) {
        arktest.assertEQ(result.length, 2, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, 'aabaac', 'input');
        arktest.assertEQ(result[0], 'aaba', 'element 0');
        arktest.assertEQ(result[1], 'ba', 'element 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}