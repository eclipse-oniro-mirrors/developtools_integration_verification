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

// arktsid: lookahead_positive_03
// description: Execute /[Jj]ava([Ss]cript)?(?=\:)/.exec("just Javascript: the way af jedi") and check results
// Conversion notes:
// - (?=) is a zero-width positive lookahead; it matches without consuming, so "Javascript" is matched and "script" is
// captured

function main(): void {
    let r: RegExp = new RegExp('[Jj]ava([Ss]cript)?(?=\\:)');
    let m: RegExpExecArray | null = r.exec('just Javascript: the way af jedi');
    if (m != null) {
        arktest.assertEQ(m.length, 2, '__executed.length');
        arktest.assertEQ(m.index, 5, '__executed.index');
        arktest.assertEQ(m.input, 'just Javascript: the way af jedi', '__executed.input');
        arktest.assertEQ(m[0], 'Javascript', '__executed[0]');
        arktest.assertEQ(m[1], 'script', '__executed[1]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}