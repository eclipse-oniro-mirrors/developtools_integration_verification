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

// arktsid: quantifier_star_19
// description: Execute /bc..[\d]*[\s]*/.exec('abcdef') and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("bc..[\\d]*[\\s]*"); against 'abcdef' the quantified
//    classes match empty at the end, so the whole match is "bcde" at index 1.

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('bc..[\\d]*[\\s]*').exec('abcdef');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'length');
        arktest.assertEQ(executed.index, 1, 'index');
        arktest.assertEQ(executed.input, 'abcdef', 'input');
        arktest.assertEQ(executed[0], 'bcde', 'matched substring');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}