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
// arktsid: group_29
// description: Execute /^([a-z]+)*[a-z]$/.exec("abc") and check length/index/input/captured group results

function main(): void {
    let r: RegExp = new RegExp('^([a-z]+)*[a-z]$');
    let result: RegExpExecArray | null = r.exec('abc');
    if (result != null) {
        arktest.assertEQ(result.length, 2, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, 'abc', 'input');
        arktest.assertEQ(result[0], 'abc', 'element 0');
        arktest.assertEQ(result[1], 'ab', 'element 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}