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
// arktsid: quantifier_plus_06
// description: Execute /[a-z]+\d+/.exec("__abc123.0") and check results

function main(): void {
    let re: RegExp = new RegExp('[a-z]+\\d+');
    let executed: RegExpExecArray | null = re.exec('__abc123.0');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'executed.length is expected to equal 1');
        arktest.assertEQ(executed.index, 2, 'executed.index is expected to equal 2');
        arktest.assertEQ(executed.input, '__abc123.0', 'executed.input is expected to equal \'__abc123.0\'');
        arktest.assertEQ(executed[0], 'abc123', 'executed[0] is expected to equal \'abc123\'');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}