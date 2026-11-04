/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: assertion_non_word_boundary_05
// description: Execute /\w\B/.exec("devils arise\tfor\nevil") and check results

function main(): void {
    let re: RegExp = new RegExp('\\w\\B');
    let m: RegExpExecArray | null = re.exec('devils arise\tfor\nrevil');
    arktest.assertEQ(m!.length, 1);
    arktest.assertEQ(m!.index, 0);
    arktest.assertEQ(m!.input, 'devils arise\tfor\nrevil');
    arktest.assertEQ(m![0], 'd');
}