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

// arktsid: lookahead_negative_01
// description: Execute /(.*?)a(?!(a+)b\2c)\2(.*)/.exec("baaabaac") and check results
// Conversion notes:
//  - negative lookahead (?!...) combined with a backreference \2: the regex literal is
//    rewritten as new RegExp("(.*?)a(?!(a+)b\\2c)\\2(.*)"). The inner group (a+) inside the
//    negative lookahead fails to match, so its capture group is undefined in the result.

function main(): void {
    let r: RegExp = new RegExp('(.*?)a(?!(a+)b\\2c)\\2(.*)');
    let m: RegExpExecArray | null = r.exec('baaabaac');
    if (m != null) {
        arktest.assertEQ(m.length, 4, 'length');
        arktest.assertEQ(m.index, 0, 'index');
        arktest.assertEQ(m.input, 'baaabaac', 'input');
        arktest.assertEQ(m[0], 'baaabaac', 'm[0]');
        arktest.assertEQ(m[1], 'ba', 'm[1]');
        arktest.assertEQ(m[2], undefined, 'm[2]');
        arktest.assertEQ(m[3], 'abaac', 'm[3]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}