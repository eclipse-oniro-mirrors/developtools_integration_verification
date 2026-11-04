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
// arktsid: exec_global_lastindex_01
// description: Call first exec, then set re.lastIndex = 12 and again call exec

function main(): void {
    let re: RegExp = new RegExp('(?:ab|cd)\\d?', 'g');

    let executed: RegExpExecArray | null = re.exec('aacd2233ab12nm444ab42');
    if (executed == null) {
        arktest.assertTrue(false, 'first exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 1, 'first length');
    arktest.assertEQ(executed.index, 2, 'first index');
    arktest.assertEQ(executed.input, 'aacd2233ab12nm444ab42', 'first input');
    arktest.assertEQ(executed[0], 'cd2', 'first element 0');

    re.lastIndex = 12;

    executed = re.exec('aacd2233ab12nm444ab42');
    if (executed == null) {
        arktest.assertTrue(false, 'second exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 1, 'second length');
    arktest.assertEQ(executed.index, 17, 'second index');
    arktest.assertEQ(executed.input, 'aacd2233ab12nm444ab42', 'second input');
    arktest.assertEQ(executed[0], 'ab4', 'second element 0');
}