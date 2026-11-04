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
// arktsid: quantifier_plus_08
// description: Execute /[a-z]+(\d+)/.exec("__abc123.0") and check results

function main(): void {
    let r: RegExp = new RegExp('[a-z]+(\\d+)');
    let m: RegExpExecArray | null = r.exec('__abc123.0');
    if (m != null) {
        arktest.assertEQ(m.length, 2, 'length');
        arktest.assertEQ(m.index, 2, 'index');
        arktest.assertEQ(m.input, '__abc123.0', 'input');
        arktest.assertEQ(m[0], 'abc123', 'matched[0]');
        arktest.assertEQ(m[1], '123', 'matched[1]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}