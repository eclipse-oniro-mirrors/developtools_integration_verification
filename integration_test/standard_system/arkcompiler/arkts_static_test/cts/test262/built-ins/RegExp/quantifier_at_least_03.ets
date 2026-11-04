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
// arktsid: quantifier_at_least_03
// description: Execute /\d{1,}/.exec("wqe456646dsff") and check results

function main(): void {
    let r: RegExp = new RegExp('\\d{1,}');
    let m: RegExpExecArray | null = r.exec('wqe456646dsff');
    if (m != null) {
        arktest.assertEQ(m.length, 1, '__executed.length');
        arktest.assertEQ(m.index, 3, '__executed.index');
        arktest.assertEQ(m.input, 'wqe456646dsff', '__executed.input');
        arktest.assertEQ(m[0], '456646', '__executed[0]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}