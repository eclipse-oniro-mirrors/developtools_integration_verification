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
// arktsid: assertion_non_word_boundary_01
// description: Execute /\Bevil\B/.exec("devils arise\tfor\nevil") and check results

function main(): void {
    let r: RegExp = new RegExp('\\Bevil\\B');
    let executed: RegExpExecArray | null = r.exec('devils arise\tfor\nevil');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'length');
        arktest.assertEQ(executed.index, 1, 'index');
        arktest.assertEQ(executed.input, 'devils arise\tfor\nevil', 'input');
        arktest.assertEQ(executed[0], 'evil', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}