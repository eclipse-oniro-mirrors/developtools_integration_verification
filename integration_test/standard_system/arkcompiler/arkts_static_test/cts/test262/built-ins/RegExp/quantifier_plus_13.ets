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

// arktsid: quantifier_plus_13
// description: Execute /(b+)(b*)/.exec("abbbbbbbc") and check results

function main(): void {
    let r: RegExp = new RegExp('(b+)(b*)');
    let m: RegExpExecArray | null = r.exec('abbbbbbbc');
    arktest.assertTrue(m != null, 'exec should return a match');
    if (m != null) {
        arktest.assertEQ(m.length, 3, 'length');
        arktest.assertEQ(m.index, 1, 'index');
        arktest.assertEQ(m.input, 'abbbbbbbc', 'input');
        arktest.assertEQ(m[0], 'bbbbbbb', 'm[0]');
        arktest.assertEQ(m[1], 'bbbbbbb', 'm[1]');
        arktest.assertEQ(m[2], '', 'm[2]');
    }
}