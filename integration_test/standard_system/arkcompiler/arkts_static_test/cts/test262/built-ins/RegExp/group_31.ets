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
// arktsid: group_31
// description: Execute /^(([a-z]+)*([a-z])\.)+[a-z]{2,}$/.exec("www.netscape.com") and check results
// Conversion notes:
// - Nested capture groups: outer group captures "netscape.", greedy ([a-z]+)* captures "netscap", ([a-z]) captures "e".

function main(): void {
    let r: RegExp = new RegExp('^(([a-z]+)*([a-z])\\.)+[a-z]{2,}$');
    let executed: RegExpExecArray | null = r.exec('www.netscape.com');

    let expected: String[] = ['www.netscape.com', 'netscape.', 'netscap', 'e'];

    if (executed != null) {
        arktest.assertEQ(executed.length, expected.length, 'length');
        arktest.assertEQ(executed.index, 0, 'index');
        arktest.assertEQ(executed.input, 'www.netscape.com', 'input');
        for (let i = 0; i < expected.length; i++) {
            arktest.assertEQ(executed[i], expected[i], 'element ' + i);
        }
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}