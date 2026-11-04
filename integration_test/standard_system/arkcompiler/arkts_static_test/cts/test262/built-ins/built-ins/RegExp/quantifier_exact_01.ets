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

// arktsid: quantifier_exact_01
// description: QuantifierPrefix :: ? returns results 0 and 1: /\w{3}\d?/ matches "box1" (index 5) in
// "CE\uFFFFL\uFFDDbox127"
// Conversion notes:
//  - the input string keeps the non-character code points \uFFFF and \uFFDD, which \w does not match,
//    so the first \w{3}\d? match is "box1" at index 5

function main(): void {
    let executed = new RegExp('\\w{3}\\d?').exec('CE\uFFFFL\uFFDDbox127');
    arktest.assertEQ(executed!.length, 1);
    arktest.assertEQ(executed!.index, 5);
    arktest.assertEQ(executed!.input, 'CE\uFFFFL\uFFDDbox127');
    arktest.assertEQ(executed![0], 'box1');
}