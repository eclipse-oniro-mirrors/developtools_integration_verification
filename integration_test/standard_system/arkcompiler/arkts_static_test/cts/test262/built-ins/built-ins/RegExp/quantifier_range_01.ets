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

// arktsid: quantifier_range_01
// description: Execute /\d{2,4}/.exec("the answer is 42") and check results

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('\\d{2,4}').exec('the answer is 42');
    if (executed == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 1, 'length');
    arktest.assertEQ(executed.index, 14, 'index');
    arktest.assertEQ(executed.input, 'the answer is 42', 'input');
    arktest.assertEQ(executed[0], '42', 'element 0');
}