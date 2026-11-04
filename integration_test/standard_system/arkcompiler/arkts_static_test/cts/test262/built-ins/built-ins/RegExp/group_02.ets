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

// arktsid: group_02
// description: Execute /([Jj]ava([Ss]cript)?)\sis\s(fun\w*)/.exec("Developing with Java is fun, try it") and check
// results

function main(): void {
    let r: RegExp = new RegExp('([Jj]ava([Ss]cript)?)\\sis\\s(fun\\w*)');
    let m: RegExpExecArray | null = r.exec('Developing with Java is fun, try it');
    if (m != null) {
        arktest.assertEQ(m.length, 4, 'length');
        arktest.assertEQ(m.index, 16, 'index');
        arktest.assertEQ(m.input, 'Developing with Java is fun, try it', 'input');
        arktest.assertEQ(m[0], 'Java is fun', 'm[0]');
        arktest.assertEQ(m[1], 'Java', 'm[1]');
        arktest.assertEQ(m[2], undefined, 'm[2]');
        arktest.assertEQ(m[3], 'fun', 'm[3]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}