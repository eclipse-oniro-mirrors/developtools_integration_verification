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

// arktsid: alternation_01
// description: Execute /a|ab/.exec("abc") and check results
// Conversion notes:
//  - alternation is left-priority; "a|ab" matches "a" at index 0 of "abc"

function main(): void {
    let r: RegExp = new RegExp('a|ab');
    let m = r.exec('abc');
    arktest.assertEQ(m!.length, 1, '__executed.length');
    arktest.assertEQ(m!.index, 0, '__executed.index');
    arktest.assertEQ(m!.input, 'abc', '__executed.input');
    arktest.assertEQ(m![0], 'a', '__executed[0]');
}