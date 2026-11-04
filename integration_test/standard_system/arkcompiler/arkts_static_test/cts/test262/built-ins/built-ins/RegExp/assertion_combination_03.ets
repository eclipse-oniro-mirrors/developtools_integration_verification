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

// arktsid: assertion_combination_03
// description: while asterix is non greedy it is run till matches end or colon
// Conversion notes:
//  - /^.*?(:|$)/ matches "Hello:" in "Hello: World"; non-greedy .*? stops at the first ':' captured by the group

function main(): void {
    let re: RegExp = new RegExp('^.*?(:|$)');
    let m: RegExpExecArray | null = re.exec('Hello: World');
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 2, 'length');
    arktest.assertEQ(m.index, 0, 'index');
    arktest.assertEQ(m.input, 'Hello: World', 'input');
    arktest.assertEQ(m[0], 'Hello:', 'match[0]');
    arktest.assertEQ(m[1], ':', 'match[1]');
}