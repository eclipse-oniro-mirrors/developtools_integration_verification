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
// arktsid: atom_dot_02
// description: Atom . does not match line terminators (execute /.+/.exec("line 1\nline 2"))
// Conversion notes:
//  - The `.` atom excludes <LF>, <CR>, <LS>, <PS>, so /.+/ stops at the first newline.

function main(): void {
    let s: String = 'line 1\nline 2';
    let r: RegExp = new RegExp('.+');
    let result: RegExpExecArray | null = r.exec(s);
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, s, 'input');
        arktest.assertEQ(result[0], 'line 1', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}