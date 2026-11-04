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
// arktsid: group_30
// description: Execute /^(([a-z]+)*[a-z]\\.)+[a-z]{2,}$/.exec("www.netscape.com") and check length/index/input/capture
// group results

function main(): void {
    let r: RegExp = new RegExp('^(([a-z]+)*[a-z]\\.)+[a-z]{2,}$');
    let m: RegExpExecArray | null = r.exec('www.netscape.com');
    if (m != null) {
        arktest.assertEQ(m.length, 3, 'length');
        arktest.assertEQ(m.index, 0, 'index');
        arktest.assertEQ(m.input, 'www.netscape.com', 'input');
        arktest.assertEQ(m[0], 'www.netscape.com', 'm[0]');
        arktest.assertEQ(m[1], 'netscape.', 'm[1]');
        arktest.assertEQ(m[2], 'netscap', 'm[2]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}