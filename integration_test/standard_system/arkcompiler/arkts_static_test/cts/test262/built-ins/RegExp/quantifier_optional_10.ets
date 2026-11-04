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

// arktsid: quantifier_optional_10
// description: Execute /ab?c?d?x?y?z/.exec("123az789") and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("ab?c?d?x?y?z"); the quantified optional
//    letters b/c/d/x/y are all skipped, so the match is "az" at index 3.

function main(): void {
    let r: RegExp = new RegExp('ab?c?d?x?y?z');
    let result: RegExpExecArray | null = r.exec('123az789');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 3, 'index');
        arktest.assertEQ(result.input, '123az789', 'input');
        arktest.assertEQ(result[0], 'az', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}