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

// arktsid: assertion_combination_04
// description: Execute /^.*(:|$)/.exec("Hello: World") and check results
// Conversion notes:
//  - greedy .* consumes "Hello: World"; the (:|$) alternation then matches $ (end anchor),
//    so the capturing group is the empty string "".

function main(): void {
    let r: RegExp = new RegExp('^.*(:|$)');
    let m = r.exec('Hello: World');
    arktest.assertEQ(m!.length, 2, '__executed.length');
    arktest.assertEQ(m!.index, 0, '__executed.index');
    arktest.assertEQ(m!.input, 'Hello: World', '__executed.input');
    arktest.assertEQ(m![0], 'Hello: World', '__executed[0]');
    arktest.assertEQ(m![1], '', '__executed[1]');
}