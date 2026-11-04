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

// arktsid: quantifier_star_14
// description: Execute /(\d*)(\d+)/.exec('1234567890') and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("(\\d*)(\\d+)"); greedy \d* consumes nine digits
//    leaving the last one for \d+, so group 1 is "123456789" and group 2 is "0".

function main(): void {
    let r: RegExp = new RegExp('(\\d*)(\\d+)');
    let result: RegExpExecArray | null = r.exec('1234567890');
    if (result != null) {
        arktest.assertEQ(result.length, 3, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, '1234567890', 'input');
        arktest.assertEQ(result[0], '1234567890', 'element 0');
        arktest.assertEQ(result[1], '123456789', 'element 1');
        arktest.assertEQ(result[2], '0', 'element 2');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}