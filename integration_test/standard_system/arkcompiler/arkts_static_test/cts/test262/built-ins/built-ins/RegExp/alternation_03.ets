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

// arktsid: alternation_03
// description: Execute /\d{3}|[a-z]{4}/.exec("2, 12 and of course repeat 12") and check results
// Conversion notes:
//  - alternation is left-priority; "\d{3}" fails so "[a-z]{4}" matches "cour" at index 13

function main(): void {
    let r: RegExp = new RegExp('\\d{3}|[a-z]{4}');
    let m = r.exec('2, 12 and of course repeat 12');
    arktest.assertEQ(m!.length, 1, '__executed.length');
    arktest.assertEQ(m!.index, 13, '__executed.index');
    arktest.assertEQ(m!.input, '2, 12 and of course repeat 12', '__executed.input');
    arktest.assertEQ(m![0], 'cour', '__executed[0]');
}