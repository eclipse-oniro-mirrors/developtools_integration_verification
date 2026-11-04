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

// arktsid: quantifier_star_13
// description: Execute /(x*)(x+)/.exec('xxxxxxx') and check results
// Conversion notes: regex literal -> new RegExp("(x*)(x+)"); capture groups asserted via [0]/[1]/[2] index access

function main(): void {
    let re: RegExp = new RegExp('(x*)(x+)');
    let result: RegExpExecArray | null = re.exec('xxxxxxx');
    if (result != null) {
        arktest.assertEQ(result.length, 3, '__executed.length');
        arktest.assertEQ(result.index, 0, '__executed.index');
        arktest.assertEQ(result.input, 'xxxxxxx', '__executed.input');
        arktest.assertEQ(result[0], 'xxxxxxx', '__executed[0]');
        arktest.assertEQ(result[1], 'xxxxxx', '__executed[1]');
        arktest.assertEQ(result[2], 'x', '__executed[2]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}