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
// arktsid: lookahead_positive_04
// description: Execute /[Jj]ava([Ss]cript)?(?=\:)/.exec("taste of java: the cookbook ") and check results

function main(): void {
    let r: RegExp = new RegExp('[Jj]ava([Ss]cript)?(?=\\:)');
    let m: RegExpExecArray | null = r.exec('taste of java: the cookbook ');
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 2, 'length');
    arktest.assertEQ(m.index, 9, 'index');
    arktest.assertEQ(m.input, 'taste of java: the cookbook ', 'input');
    arktest.assertEQ(m[0], 'java', 'element[0]');
    arktest.assertEQ(m[1], undefined, 'element[1]');
}