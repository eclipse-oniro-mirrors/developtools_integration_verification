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

// arktsid: assertion_combination_02
// description: Execute /^.*?/.exec("Hello World") and check results

function main(): void {
    let regObj: RegExp = new RegExp('^.*?');
    let result: RegExpExecArray | null = regObj.exec('Hello World');
    if (result == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(result.length, 1, 'length');
    arktest.assertEQ(result.index, 0, 'index');
    arktest.assertEQ(result.input, 'Hello World', 'input');
    arktest.assertEQ(result[0], '', 'captured group 0');
}