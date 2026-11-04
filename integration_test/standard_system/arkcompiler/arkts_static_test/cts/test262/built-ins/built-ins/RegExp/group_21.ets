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

// arktsid: group_21
// description: Execute /(A)?(A.*)/.exec("zxcasd;fl\\\  ^AAAaaAAaaaf;lrlrzs") and check results
// Conversion notes:
//  - the input contains a literal backslash followed by two spaces; the first "A" occurs at index 13,
//    group 1 "(A)?" captures "A" and group 2 "(A.*)" captures the remainder "AAaaAAaaaf;lrlrzs".

function main(): void {
    let r: RegExp = new RegExp('(A)?(A.*)');
    let m: RegExpExecArray | null = r.exec('zxcasd;fl\\  ^AAAaaAAaaaf;lrlrzs');
    if (m != null) {
        arktest.assertEQ(m.length, 3, 'length');
        arktest.assertEQ(m.index, 13, 'index');
        arktest.assertEQ(m.input, 'zxcasd;fl\\  ^AAAaaAAaaaf;lrlrzs', 'input');
        arktest.assertEQ(m[0], 'AAAaaAAaaaf;lrlrzs', 'm[0]');
        arktest.assertEQ(m[1], 'A', 'm[1]');
        arktest.assertEQ(m[2], 'AAaaAAaaaf;lrlrzs', 'm[2]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}