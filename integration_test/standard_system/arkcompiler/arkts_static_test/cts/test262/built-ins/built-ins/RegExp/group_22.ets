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

// arktsid: group_22
// description: Execute /(A)?(A.*)/.exec("zxcasd;fl\\  ^AAaaAAaaaf;lrlrzs") and check results
// Conversion notes:
//  - optional group (A)? greedily captures the first "A" (index 13) and (A.*) captures the
//    rest from index 14, so the full match is "AAaaAAaaaf;lrlrzs" at index 13.

function main(): void {
    let r: RegExp = new RegExp('(A)?(A.*)');
    let m: RegExpExecArray | null = r.exec('zxcasd;fl\\  ^AAaaAAaaaf;lrlrzs');
    if (m != null) {
        arktest.assertEQ(m.length, 3, 'length');
        arktest.assertEQ(m.index, 13, 'index');
        arktest.assertEQ(m.input, 'zxcasd;fl\\  ^AAaaAAaaaf;lrlrzs', 'input');
        arktest.assertEQ(m[0], 'AAaaAAaaaf;lrlrzs', 'm[0]');
        arktest.assertEQ(m[1], 'A', 'm[1]');
        arktest.assertEQ(m[2], 'AaaAAaaaf;lrlrzs', 'm[2]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}