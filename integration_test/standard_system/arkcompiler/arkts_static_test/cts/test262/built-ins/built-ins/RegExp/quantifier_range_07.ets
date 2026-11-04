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
// arktsid: quantifier_range_07
// description: Execute /\d{2,4}/.exec("0a01122b") and check results

function main(): void {
    let r: RegExp = new RegExp('\\d{2,4}');
    let m: RegExpExecArray | null = r.exec('0a01122b');
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 1, 'length');
    arktest.assertEQ(m.index, 2, 'index');
    arktest.assertEQ(m.input, '0a01122b', 'input');
    arktest.assertEQ(m[0], '0112', 'element[0]');
}