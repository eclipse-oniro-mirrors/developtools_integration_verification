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
// arktsid: assertion_non_word_boundary_07
// description: Execute /\B[^z]{4}\B/.exec("devil arise\tforzzx\nevils") and check results

function main(): void {
    let executed = new RegExp('\\B[^z]{4}\\B').exec('devil arise\tforzzx\nevils');
        arktest.assertEQ(executed!.length, 1,
        'The value of executed.length is expected to equal the value of expected.length');
        arktest.assertEQ(executed!.index, 3,
        'The value of executed.index is expected to equal the value of expected.index');
        arktest.assertEQ(executed!.input, 'devil arise\tforzzx\nevils',
        'The value of executed.input is expected to equal the value of expected.input');
        arktest.assertEQ(executed![0], 'il a',
        'The value of executed[0] is expected to equal the value of expected[0]');
}