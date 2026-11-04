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

// arktsid: quantifier_range_04
// description: Execute /\d{2,4}/.exec("the Fahrenheit 451 book") and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("\\d{2,4}"); the quantifier {2,4} greedily matches the
//    digits "451" at index 15, so the result has length 1, index 15, input equal to the source string.

function main(): void {
    let r: RegExp = new RegExp('\\d{2,4}');
    let result: RegExpExecArray | null = r.exec('the Fahrenheit 451 book');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 15, 'index');
        arktest.assertEQ(result.input, 'the Fahrenheit 451 book', 'input');
        arktest.assertEQ(result[0], '451', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}