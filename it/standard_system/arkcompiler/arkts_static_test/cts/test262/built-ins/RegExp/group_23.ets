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

// arktsid: group_23
// description: Execute /(A)?(A.*)/.exec("zxcasd;fl\\  ^AaaAAaaaf;lrlrzs") and check the optional group is undefined
// Conversion notes:
//  - the optional group (A)? does not participate in the match, because the following
//    (A.*) must start with the "A" at index 13; group 1 is therefore undefined while
//    group 2 captures the whole matched tail "AaaAAaaaf;lrlrzs".

function main(): void {
    let r: RegExp = new RegExp('(A)?(A.*)');
    let m: RegExpExecArray | null = r.exec('zxcasd;fl\\  ^AaaAAaaaf;lrlrzs');
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 3, 'length');
    arktest.assertEQ(m.index, 13, 'index');
    arktest.assertEQ(m.input, 'zxcasd;fl\\  ^AaaAAaaaf;lrlrzs', 'input');
    arktest.assertEQ(m[0], 'AaaAAaaaf;lrlrzs', 'group 0');
    arktest.assertEQ(m[1], undefined, 'group 1 (optional A) unmatched');
    arktest.assertEQ(m[2], 'AaaAAaaaf;lrlrzs', 'group 2');
}