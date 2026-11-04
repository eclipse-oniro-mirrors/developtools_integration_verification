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
// arktsid: exec_lastindex_out_of_range_01
// description: First call /(?:ab|cd)\d?/g.exec("aac1dz2233a1bz12nm444ab42") returns ["ab4"] at index 21; then exec on
// "aacd22" returns null and resets lastIndex to 0

function main(): void {
    let re = new RegExp('(?:ab|cd)\\d?', 'g');
    let executed: RegExpExecArray | null = re.exec('aac1dz2233a1bz12nm444ab42');
    if (executed == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 1, 'length');
    arktest.assertEQ(executed.index, 21, 'index');
    arktest.assertEQ(executed.input, 'aac1dz2233a1bz12nm444ab42', 'input');
    arktest.assertEQ(executed[0], 'ab4', 'element 0');

    executed = re.exec('aacd22');
    arktest.assertEQ(executed, null, 'second exec returns null');
    arktest.assertEQ(re.lastIndex, 0, 'lastIndex reset to 0');
}