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

// arktsid: group_20
// description: Execute /^(A)?(A.*)$/.exec("A") and check results
// Conversion notes:
//  - the optional capturing group (A)? does not participate in the match, so m[1] is undefined
//    while the second group (A.*) captures "A".

function main(): void {
    let r: RegExp = new RegExp('^(A)?(A.*)$');
    let m: RegExpExecArray | null = r.exec('A');
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 3, 'length');
    arktest.assertEQ(m.index, 0, 'index');
    arktest.assertEQ(m.input, 'A', 'input');
    arktest.assertEQ(m[0], 'A', 'element 0');
    arktest.assertEQ(m[1], undefined, 'element 1 (non-participating group)');
    arktest.assertEQ(m[2], 'A', 'element 2');
}