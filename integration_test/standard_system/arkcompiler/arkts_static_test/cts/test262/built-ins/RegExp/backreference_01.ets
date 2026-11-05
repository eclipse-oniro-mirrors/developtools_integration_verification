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

// arktsid: backreference_01
// description: Execute /\b(\w+) \1\b/.exec("do you listen the the band") and check results
// Conversion notes:
//  - backreference \1 is written as "\\1" in the RegExp constructor string; the match
//    "the the" (index 14) has capture group "the".

function main(): void {
    let r: RegExp = new RegExp('\\b(\\w+) \\1\\b');
    let result: RegExpExecArray | null = r.exec('do you listen the the band');
    if (result != null) {
        arktest.assertEQ(result.length, 2, 'length');
        arktest.assertEQ(result.index, 14, 'index');
        arktest.assertEQ(result.input, 'do you listen the the band', 'input');
        arktest.assertEQ(result[0], 'the the', 'group 0');
        arktest.assertEQ(result[1], 'the', 'group 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}