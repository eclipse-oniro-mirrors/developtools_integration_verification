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

// arktsid: group_17
// description: Parentheses ( Disjunction ) group and capture; an optional capture group that does not participate
// returns undefined
// Conversion notes:
// - optional inner capture group ( [ \t]+[\S]+ )* does not participate when the matched value has a single
// non-whitespace run

function main(): void {
    let executed: RegExpExecArray | null =
        new RegExp('([\\S]+([ \\t]+[\\S]+)*)[ \\t]*=[ \\t]*[\\S]+').exec('Course_Creator = Test');

    arktest.assertNE(executed, null, 'executed should be a non-null match');
    let m: RegExpExecArray = executed!;

    arktest.assertEQ(m.length, 3, 'executed.length');
    arktest.assertEQ(m.index, 0, 'executed.index');
    arktest.assertEQ(m.input, 'Course_Creator = Test', 'executed.input');
    arktest.assertEQ(m[0], 'Course_Creator = Test', 'executed[0]');
    arktest.assertEQ(m[1], 'Course_Creator', 'executed[1]');
    arktest.assertEQ(m[2], undefined, 'executed[2]');
}