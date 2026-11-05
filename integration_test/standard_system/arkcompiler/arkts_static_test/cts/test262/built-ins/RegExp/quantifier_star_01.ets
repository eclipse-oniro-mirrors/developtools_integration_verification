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

// arktsid: quantifier_star_01
// description: Execute /[^"]*/.exec('"beast"-nickname') and check the empty-match result (length/index/input/[0])
// Conversion notes:
//  - regex literal rewritten as new RegExp("[^\"]*"); against the input '"beast"-nickname' the leading
//    quote makes the quantified class match the empty string at index 0.

function main(): void {
    let r: RegExp = new RegExp('[^"]*');
    let result: RegExpExecArray | null = r.exec('"beast"-nickname');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, '"beast"-nickname', 'input');
        arktest.assertEQ(result[0], '', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}