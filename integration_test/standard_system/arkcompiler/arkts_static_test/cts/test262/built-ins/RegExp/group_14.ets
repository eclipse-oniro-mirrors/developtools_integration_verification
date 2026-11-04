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
// arktsid: group_14
// description: Execute /a(.?)b\1c\1d\1/.exec("abcd") and check results
// Conversion notes:
//  - Backreference \1 refers to an empty capture group ((.?) matches the empty string).

function main(): void {
    let r: RegExp = new RegExp('a(.?)b\\1c\\1d\\1');
    let executed: RegExpExecArray | null = r.exec('abcd');

    let expected: String[] = ['abcd', ''];

    if (executed != null) {
        arktest.assertEQ(executed.length, expected.length, 'length');
        arktest.assertEQ(executed.index, 0, 'index');
        arktest.assertEQ(executed.input, 'abcd', 'input');
        for (let i = 0; i < expected.length; i++) {
            arktest.assertEQ(executed[i], expected[i], 'element ' + i);
        }
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}