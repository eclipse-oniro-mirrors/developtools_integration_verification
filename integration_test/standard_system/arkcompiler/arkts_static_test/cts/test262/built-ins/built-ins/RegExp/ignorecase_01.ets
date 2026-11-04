/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: ignorecase_01
// description: Execute /[a-z]+/ig.exec("ABC def ghi") and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("[a-z]+", "ig"); the "i" flag makes the match
//    case-insensitive, so [a-z]+ matches the leading "ABC".

function main(): void {
    let str: String = 'ABC def ghi';
    let r: RegExp = new RegExp('[a-z]+', 'ig');
    let result: RegExpExecArray | null = r.exec(str);
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, str, 'input');
        arktest.assertEQ(result[0], 'ABC', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}