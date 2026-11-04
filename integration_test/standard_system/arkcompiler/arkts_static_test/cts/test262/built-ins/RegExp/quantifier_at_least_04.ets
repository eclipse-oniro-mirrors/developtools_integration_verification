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

// arktsid: quantifier_at_least_04
// description: Execute /(123){1,}/.exec("123123") and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("(123){1,}"); the greedy quantifier {1,} consumes the
//    whole "123123", so the match is "123123" with capture group 1 equal to the last "123".

function main(): void {
    let r: RegExp = new RegExp('(123){1,}');
    let result: RegExpExecArray | null = r.exec('123123');
    if (result != null) {
        arktest.assertEQ(result.length, 2, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, '123123', 'input');
        arktest.assertEQ(result[0], '123123', 'element 0');
        arktest.assertEQ(result[1], '123', 'element 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}